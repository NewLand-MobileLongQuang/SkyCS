import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/string_generate.dart';

import '../../../../../core/res/media_res.dart';
import '../../../../../fake_data/fake_data_eTicket.dart';
import '../cubit/eTicket_manage_cubit/eTicket_manage_cubit.dart';

class eTicketManageScreen extends StatefulWidget {
  const eTicketManageScreen({super.key});

  static const routeName = '/eTicket';

  @override
  State<eTicketManageScreen> createState() => _eTicketManageScreenState();
}

class _eTicketManageScreenState extends State<eTicketManageScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isEmptyData = true;

  @override
  void initState() {
    context.read<eTicketManageCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textWhiteColor,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: _textTitle(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(),
            SizedBox(
              child: Text(
                'Tổng: 3',
                style: AppTextStyles.textStyleInterW400S14Grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 16),
            _listGuarantee(context),
            _buttonAdd()
          ],
        ),
      ),
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.eTicketmanage,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _searchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                isEmptyData = value.isEmpty;
              });
            },
            onSubmitted: (value) {
              setState(() {
                isEmptyData = value.isEmpty;
              });
            },
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'Tìm kiếm',
              filled: true,
              fillColor: Colors.green[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              suffixIcon: isEmptyData == true
                  ? PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Text('Tìm kiếm nâng cao'),
                    onTap: () {
                      Navigator.pushNamed(context, '/advanced-search');
                    },
                  ),
                ],
              )
                  : IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  setState(() {
                    isEmptyData = true;
                  });
                },
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
        ),
      ],
    );
  }

  Widget _listGuarantee(BuildContext context) {
    return Expanded(
      child: BlocConsumer<eTicketManageCubit, eTicketManageState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is eTicketManageLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is eTicketManageLoaded) {
            return ListView.separated(
              itemCount: state.eticketList.length,
              separatorBuilder: (context, index) =>
                  Container(height: 1, color: AppColors.divideColor),
              itemBuilder: (context, index) {
                return _itemeTicket(context, state.eticketList[index]);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _itemeTicket(BuildContext context, Eticketmanage eticket) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/eTicket_detail',arguments: eticket.ColCodeSys);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.textWhiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            eticket.ColCaption,
                            style: AppTextStyles.textStyleInterW400S16Black,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          '2 giờ',
                          style: AppTextStyles.textStyleInterW400S14Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Row(
                                children: [
                                  SvgPicture.asset(AppMediaRes.iconCallIn,),
                                  Text(
                                    eticket.NameCus,
                                    style: AppTextStyles.textStyleInterW400S14Grey,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ],
                        ),
                      ),),
                      SizedBox(
                        child: Text(
                          eticket.Status,
                          style: TextStyle(color: eticket.Status == "Open" ? Colors.yellowAccent[700]:
                          eticket.Status == "Processing" ? Colors.orangeAccent[700]:Colors.blue[400]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            eticket.Created,
                            style: AppTextStyles.textStyleInterW400S14Grey,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: CircleAvatar(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              StringGenerate.getCurrentTitle(eticket.NameCus).toUpperCase(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buttonAdd() {
    return Row(
      children: [
        Expanded(child: Container()),
        ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, '/eTicket_create');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            minimumSize: const Size(64, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.textWhiteColor,
          ),
        ),
      ],
    );
  }
}
