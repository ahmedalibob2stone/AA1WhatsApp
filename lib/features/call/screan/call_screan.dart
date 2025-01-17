
import 'package:AA1WhatsApp/common/widgets/Loeading.dart';
import 'package:AA1WhatsApp/config/agora_Developer.dart';
import 'package:AA1WhatsApp/features/call/controller/call_controller.dart';
import 'package:AA1WhatsApp/model/call/call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CallScrean extends ConsumerStatefulWidget {
  final String channelId;
  final Call call;
  final bool isGroupChat;
  const CallScrean({
    Key? key,
    required this.channelId,
    required this.call,
    required this.isGroupChat,
  }) : super(key: key);

  @override
  ConsumerState<CallScrean> createState() => _CallScreanState();
}


class _CallScreanState extends ConsumerState<CallScrean> {
  AgoraClient? client;
  String baseUrl = dotenv.env['BASE_URL'] ?? '';

  @override
  void initState() {
    super.initState();
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: AgoragConfig.appId,
        channelName: widget.channelId,
        tokenUrl: baseUrl,
      ),
    );
   initAgora();

  }
  void initAgora() async {
    await client!.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: client == null
            ? const Loeading()
        : SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(client: client!),
            AgoraVideoButtons(
              client: client!,
              disconnectButtonChild: IconButton(
                onPressed: () async {
                  await client!.engine.leaveChannel();
                  ref.read(callControllerProvider).endCall(
                    widget.call.callerId,
                    widget.call.receiverId,
                    context,
                  );
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.call_end),
              ),
            )
            ],
          )
        )

    );
  }
}
