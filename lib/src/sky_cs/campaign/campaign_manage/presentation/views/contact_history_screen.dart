import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/strings.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/src/sky_cs/campaign/campaign_manage/presentation/cubit/contact_history_cubit/contact_history_cubit.dart';

class ContactHistoryScreen extends StatefulWidget {
  const ContactHistoryScreen({super.key});

  static const String routeName = '/contact-history';

  @override
  State<ContactHistoryScreen> createState() => _ContactHistoryScreenState();
}

class _ContactHistoryScreenState extends State<ContactHistoryScreen> {
  AudioPlayer _audioPlayer = AudioPlayer();
  Duration _duration = const Duration();
  Duration _position = const Duration();
  bool _isPlaying = false;

  @override
  void initState() {
    context.read<ContactHistoryCubit>().init();
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
      body: BlocConsumer<ContactHistoryCubit, ContactHistoryState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if(state is ContactHistoryLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is ContactHistoryLoaded){
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _listHistory(context),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _textTitle() {
    return Text(
      AppStrings.contactHistory,
      style: AppTextStyles.textStyleInterW500S18White,
      maxLines: 2,
    );
  }

  Widget _listHistory(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 15,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: AppColors.divideColor,
          indent: 8,
          endIndent: 8,
        ),
        itemBuilder: (context, index) {
          return _itemHistory(context);
        }
      )
    );
  }

  Widget _itemHistory(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.textWhiteColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2022-09-10 09:10',
              style: AppTextStyles.textStyleInterW500S14Black,
              // overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            Row(
              children: [
                Text(
                  'Agent phụ trách:',
                  style: AppTextStyles.textStyleInterW400S12Grey,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(child: Container(),),
                Text(
                  'Lê Quốc Trung',
                  style: AppTextStyles.textStyleInterW500S12Black,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'SĐT khách hàng:',
                  style: AppTextStyles.textStyleInterW400S12Grey,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(child: Container(),),
                Text(
                  '0123456789',
                  style: AppTextStyles.textStyleInterW500S12Black,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Thời gian gọi:',
                  style: AppTextStyles.textStyleInterW400S12Grey,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(child: Container(),),
                Text(
                  '2023-03-20 09:15',
                  style: AppTextStyles.textStyleInterW500S12Black,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Trạng thái:',
                  style: AppTextStyles.textStyleInterW400S12Grey,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(child: Container(),),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.textBlueColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    'Thành công',
                    style: AppTextStyles.textStyleInterW400S11White,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'KH phản hồi:',
                  style: AppTextStyles.textStyleInterW400S12Grey,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(child: Container(),),
                Text(
                  'Quan tâm',
                  style: AppTextStyles.textStyleInterW500S12Black,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Ghi chú:',
                  style: AppTextStyles.textStyleInterW400S12Grey,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(child: Container(),),
                Text(
                  'Xác nhận lại với khách hàng',
                  style: AppTextStyles.textStyleInterW500S12Black,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.play_arrow_sharp, size: 20,),
                Text(
                  '${_position.inMinutes}:${(_position.inSeconds % 60).toString().padLeft(2, '0')} / ${_duration.inMinutes}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: AppTextStyles.textStyleInterW400S12Black,
                ),
                Slider(
                  value: _position.inSeconds.toDouble(),
                  max: _duration.inSeconds.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      _audioPlayer.seek(Duration(seconds: value.toInt()));
                    });
                  },
                ),
                const Icon(Icons.volume_up, size: 20,),
                const Icon(Icons.more_vert, size: 20,),
                const Icon(Icons.file_download_outlined, size: 20,),
              ],
            ),
          ],
        )
      ),
    );
  }
}
