import 'package:audioplayers/audioplayers.dart';
import 'package:AA1WhatsApp/common/enums/enum_massage.dart';
import 'package:AA1WhatsApp/features/chat%20screan/widgets/VideoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../constant.dart';

class DisplayTypeofMassage extends StatelessWidget {
  const DisplayTypeofMassage({Key? key, required this.message, required this.type}) : super(key: key);
  final String message;
  final EnumData type;

  @override
  Widget build(BuildContext context) {
    final AudioPlayer audioPlayer = AudioPlayer();
    bool isPlaying = false;

    switch (type) {
      case EnumData.text:
        return Text(
          message,
          style: TextStyle(
            fontSize: 15,
            color: kkkPrimaryColor,
          ),
        );

      case EnumData.video:
        return Container(
          width: MediaQuery.of(context).size.width * 0.66,
          height: MediaQuery.of(context).size.height * 0.35,
          child: VideoPlayer(videoUrl: message),
        );

      case EnumData.audio:
        return StatefulBuilder(
          builder: (context, setState) {
            return IconButton(
              highlightColor: Colors.transparent,
              constraints: const BoxConstraints(
                maxHeight: 30,
                minWidth: 175,
              ),
              onPressed: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  await audioPlayer.play(UrlSource(message));
                  setState(() {
                    isPlaying = true;
                  });
                }
              },
              icon: Icon(
                isPlaying ? Icons.pause_circle : Icons.play_circle,
                size: 30,
                color: Colors.grey,
              ),
            );
          },
        );

      case EnumData.gif:
        return CachedNetworkImage(
          imageUrl: message,
        );

      default:
        return Container(
          width: MediaQuery.of(context).size.width * 0.66,
          height: MediaQuery.of(context).size.height * 0.35,
          child: CachedNetworkImage(
            imageUrl: message,
            fit: BoxFit.cover,
          ),
        );
    }
  }
}
