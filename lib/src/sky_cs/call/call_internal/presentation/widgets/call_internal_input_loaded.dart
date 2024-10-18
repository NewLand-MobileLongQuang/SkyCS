import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/media_res.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/fake_data/person_contact.dart';
import 'package:idnstd/src/sky_cs/call/call_out/presentation/cubit/call_out_cubit.dart';

import '../cubit/call_internal_cubit.dart';

class CallInternalInputLoadedView extends StatefulWidget {
  const CallInternalInputLoadedView({
    super.key,
  });

  @override
  State<CallInternalInputLoadedView> createState() => _CallInInputLoadedViewState();
}

class _CallInInputLoadedViewState extends State<CallInternalInputLoadedView> {
  final List<String> listCall = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '*',
    '0',
    '#'
  ];
  String dropdownValue = PersonContact.listBranch.first;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallInternalCubit, CallInternalState>(
      builder: (context, state) {
        state as CallInternalInputLoaded;
        return Column(
          children: [
            Expanded(child: _phoneArea(state)),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 72, right: 72, bottom: 24),
              children: List.generate(15, (index) {
                if (index < 12) {
                  return InkWell(
                    onTap: () {
                      //widget.onTap;
                      context
                          .read<CallOutCubit>()
                          .input(state.phoneNumber + listCall[index]);
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: AppColors.primaryOpa11,
                      ),
                      child: Center(
                        child: Text(listCall[index],
                            style: AppTextStyles.textStyleInterW500S32Black),
                      ),
                    ),
                  );
                } else if (index == 12) {
                  return InkWell(
                    onTap: () {},
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppMediaRes.iconList,
                        ),
                      ),
                    ),
                  );
                } else if (index == 13) {
                  return InkWell(
                    onTap: () {
                      context.read<CallInternalCubit>().callIn(dropdownValue, state.phoneNumber);
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppMediaRes.iconCall2,
                        ),
                      ),
                    ),
                  );
                } else {
                  return state.phoneNumber != ''
                      ? InkWell(
                          onTap: () {
                            context.read<CallOutCubit>().input(state.phoneNumber
                                .substring(0, state.phoneNumber.length - 1));
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(500),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                AppMediaRes.iconBackspace,
                              ),
                            ),
                          ),
                        )
                      : Container();
                }
              }),
            )
          ],
        );
      },
    );
  }

  Widget _phoneArea(CallInternalInputLoaded state) {
    final newList = PersonContact.listContact
        .where((element) => element.phone.contains(state.phoneNumber))
        .toList();
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.only(right: 32),
          decoration: BoxDecoration(
            color: AppColors.primaryOpa11,
            borderRadius: BorderRadius.circular(500),
          ),
          child: DropdownButton<String>(
            value: dropdownValue,
            menuMaxHeight: 150,
            icon: const FaIcon(
              FontAwesomeIcons.caretDown,
              color: AppColors.textBlackColor,
              size: 16,
            ),
            style: AppTextStyles.textStyleInterW500S16Black,
            underline: Container(
              height: 1,
              color: Colors.transparent,
            ),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            items: PersonContact.listBranch // Thay đổi đây
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    value,
                    style: AppTextStyles.textStyleInterW500S16Black,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Text(
          state.phoneNumber,
          style: AppTextStyles.textStyleInterW400S30Black,
        ),
        Expanded(
          child: newList.isNotEmpty && state.phoneNumber != ''
              ? ListView.separated(
            itemCount: newList.length,
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.transparent,
                height: 8,
              );
            },
            itemBuilder: (context, index) {
              return Row(
                children: [
                  const SizedBox(width: 32),
                  Text(
                    newList[index].name,
                    style: AppTextStyles.textStyleInterW400S14Black,
                  ),
                  Expanded(child: Container()),
                  Text(
                    newList[index].phone,
                    style: AppTextStyles.textStyleInterW400S14Grey,
                  ),
                  const SizedBox(width: 32),
                ],
              );
            },
          )
              : state.phoneNumber != ''
              ? Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Thêm khách hàng',
              style: AppTextStyles.textStyleInterW500S16Primary,
            ),
          )
              : Container(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
