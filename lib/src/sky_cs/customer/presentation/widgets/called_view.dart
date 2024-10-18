import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/media_res.dart';
import 'package:idnstd/core/res/test_style.dart';

class CalledView extends StatefulWidget {
  const CalledView({super.key});

  @override
  State<CalledView> createState() => _CalledViewState();
}

class _CalledViewState extends State<CalledView> {
  AudioPlayer _audioPlayer = AudioPlayer();
  Duration _duration = Duration();
  Duration _position = Duration();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });

    _audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });
  }

  void _playPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3' as Source);
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

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
            SvgPicture.asset(AppMediaRes.iconCallIn,),
            const SizedBox(width: 8,),
            Expanded(child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cuộc gọi đến từ khách hàng 0123456789',
                  style: AppTextStyles.textStyleInterW500S14Black,
                  // overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Row(
                  children: [
                    Text(
                      'TG gọi:',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      '2023-03-20 09:15 - 2023-03-20 09:20',
                      style: AppTextStyles.textStyleInterW500S12Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.play_arrow_sharp, size: 20,),
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
                    Icon(Icons.volume_up, size: 20,),
                    Icon(Icons.more_vert, size: 20,)
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Độ dài cuộc gọi:',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      '00:05:00',
                      style: AppTextStyles.textStyleInterW500S12Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Agent tiếp nhận:',
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
                      'Mã chiến dịch:',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      'CD001',
                      style: AppTextStyles.textStyleInterW500S12Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),)
          ],
        ),
      ),
    );
    // return InkWell(
    //   onTap: () {
    //
    //   },
    //   child: Container(
    //     padding: const EdgeInsets.all(8),
    //     width: double.infinity,
    //     decoration: const BoxDecoration(
    //       color: AppColors.white,
    //     ),
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         SvgPicture.asset(MediaRes.iconCallInMiss,),
    //         const SizedBox(width: 8,),
    //         Expanded(child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               'Cuộc gọi nhỡ đến từ khách hàng 0123456789',
    //               style: TextStyleApp.textStyleInterW500S14Black,
    //               // overflow: TextOverflow.ellipsis,
    //               maxLines: 3,
    //             ),
    //             Row(
    //               children: [
    //                 Text(
    //                   'TG gọi:',
    //                   style: TextStyleApp.textStyleInterW400S12Grey,
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //                 Expanded(child: Container(),),
    //                 Text(
    //                   '2023-03-20 09:15',
    //                   style: TextStyleApp.textStyleInterW500S12Black,
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //               ],
    //             ),
    //             Row(
    //               children: [
    //                 Text(
    //                   'Agent thực hiện:',
    //                   style: TextStyleApp.textStyleInterW400S12Grey,
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //                 Expanded(child: Container(),),
    //                 Text(
    //                   'Lê Quốc Trung',
    //                   style: TextStyleApp.textStyleInterW500S12Black,
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),)
    //       ],
    //     ),
    //   ),
    // );
  }
}
