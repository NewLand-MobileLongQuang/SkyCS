import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/media_res.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/campaign_manage_cubit/campaign_manage_cubit.dart';

class CampaignManageScreen extends StatefulWidget {
  const CampaignManageScreen({super.key});

  static const routeName = '/campaign-manage';

  @override
  State<CampaignManageScreen> createState() => _CampaignManageScreenState();
}

class _CampaignManageScreenState extends State<CampaignManageScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isEmptyData = true;

  @override
  void initState() {
    context.read<CampaignManageCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CampaignManageCubit, CampaignManageState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        if(state is CampaignManageLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is CampaignManageLoaded){
          final listCountCheck = state.checkPress.where((element) => element == true).toList().length;
          return Scaffold(
            appBar: listCountCheck == 0
                ? AppBar(
                  backgroundColor: AppColors.primaryColor,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.textWhiteColor,
                    ),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  title: _textTitle(AppStrings.campaignManageTitle,),
                )
                : AppBar(
                  backgroundColor: AppColors.primaryColor,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.textWhiteColor,
                    ),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  actions: [
                    SvgPicture.asset(AppMediaRes.iconFlag),
                    const SizedBox(width: 8),
                    const Icon(Icons.pause_circle_outline_outlined, color: AppColors.textWhiteColor,),
                  ],
                  title: _textTitle(listCountCheck.toString()),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _searchBar(context),
                  const SizedBox(height: 8),
                  _totalCampaign(),
                  const SizedBox(height: 8),
                  _listCampaign(context, state.checkPress),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _textTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _searchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                isEmptyData = value.isEmpty;
              });
              //context.read<GuaranteeManageCubit>().search(_searchController.text);
            },
            onSubmitted: (value) {
              setState(() {
                isEmptyData = value.isEmpty;
              });
              //context.read<GuaranteeManageCubit>().search(_searchController.text);
            },
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'Tìm kiếm',
              filled: true,
              fillColor: Colors.green[200],
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
                itemBuilder: (context) =>
                [
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
        const SizedBox(width: 16),
        InkWell(
          child: const Icon(
            Icons.filter_list
          ),
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: AppColors.textWhiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                        ),
                        child: Column(
                          children: [
                            _itemFilter('Thời gian bắt đầu', false),
                            const Divider(height: 1, color: AppColors.divideColor,),
                            _itemFilter('Thời gian kết thúc', false),
                            const Divider(height: 1, color: AppColors.divideColor,),
                            _itemFilter('Tên chiến dịch', false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: AppColors.textWhiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                        ),
                        child: Column(
                          children: [
                            _itemFilter('Sắp xếp tăng dần', false),
                            const Divider(height: 1, color: AppColors.divideColor,),
                            _itemFilter('Sắp xếp giảm dần', false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: AppColors.textWhiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Hủy',
                                style: AppTextStyles.textStyleInterW500S14Primary,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Save',
                                style: AppTextStyles.textStyleInterW500S14Primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        )
      ],
    );
  }

  Widget _totalCampaign() {
    return Row(
      children: [
        Expanded(child: Container()),
        Text(
          'Tổng: 10',
          style: AppTextStyles.textStyleInterW400S14Grey,
        ),
      ],
    );
  }

  Widget _listCampaign(BuildContext context, List<bool> checkPress) {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: AppColors.divideColor,
          indent: 8,
          endIndent: 8,
        ),
        itemBuilder: (context, index) {
          return _itemCampaign(context, checkPress[index], index);
        }
      )
    );
  }

  Widget _itemCampaign(BuildContext context, bool isPress, int index) {
    return InkWell(
      onLongPress: (){
        context.read<CampaignManageCubit>().chooseCampaign(index);
      },
      onTap: (){
        Navigator.pushNamed(context, '/campaign-detail');
      },
      child: Slidable (
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {

              },
              backgroundColor: AppColors.textGreenColor,
              foregroundColor: AppColors.textWhiteColor,
              icon: Icons.expand_circle_down_outlined,
              label: 'Duyệt',
            ),
            SlidableAction(
              onPressed: (context) {

              },
              backgroundColor: AppColors.textRedColor,
              foregroundColor: AppColors.textWhiteColor,
              icon: Icons.delete_outline_outlined,
              label: 'Xóa',
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: isPress ? AppColors.greenLightColor : AppColors.textWhiteColor,
            borderRadius: isPress ? BorderRadius.circular(12) : BorderRadius.circular(0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(isPress)
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset(AppMediaRes.iconDoneSlide),
                ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chiến dịch chăm sóc khách hàng VIP tháng 1 năm 2024',
                      style: AppTextStyles.textStyleInterW400S16Black,
                      // overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          'Chiến dịch telesale',
                          style: AppTextStyles.textStyleInterW400S14Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(child: Container(),),
                        Text(
                          'SLKH: 150/1500',
                          style: AppTextStyles.textStyleInterW400S14Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'TT thực hiện:',
                          style: AppTextStyles.textStyleInterW400S14Grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(child: Container(),),
                        Text(
                          'Thành công',
                          style: AppTextStyles.textStyleInterW500S14Blue,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemFilter(String title, bool isChecked) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.textStyleInterW400S16Black,
          ),
        ),
        Checkbox(
          checkColor: Colors.white,
          //fillColor: AppColors.primaryColor,
          value: isChecked,
          shape: const CircleBorder(),
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
      ],
    );
  }
}
