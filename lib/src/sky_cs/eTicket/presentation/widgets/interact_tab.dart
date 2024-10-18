import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/media_res.dart';
import 'package:idnstd/core/res/test_style.dart';

import '../../../../../core/utils/string_generate.dart';

class InteractView extends StatefulWidget {
  const InteractView({super.key});

  @override
  State<InteractView> createState() => _InteractViewState();
}

class _InteractViewState extends State<InteractView> {
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
            Column(
              children: [
                CircleAvatar(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      StringGenerate.getCurrentTitle('Nguyễn Văn An').toUpperCase(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                SvgPicture.asset(AppMediaRes.iconCallOut,),
              ],
            ),
             const SizedBox(width: 3,),
            Expanded(child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nguyễn Văn An',
                  style: AppTextStyles.textStyleInterW500S14Black,
                  // overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Row(
                  children: [
                    Icon(Icons.timer),
                    Text(
                      '2023-03-20 09:15',
                      style: AppTextStyles.textStyleInterW500S14Grey,
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
                      'CallID:',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      'ID0030474222',
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
                      '0987654321',
                      style: AppTextStyles.textStyleInterW500S12Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Thời gian cuộc gọi:',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      '09:15 - 09:35',
                      style: AppTextStyles.textStyleInterW500S12Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Dộ dài cuộc gọi:',
                      style: AppTextStyles.textStyleInterW400S12Grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(child: Container(),),
                    Text(
                      '00:00:20',
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
  }
}
