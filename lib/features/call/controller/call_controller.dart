import 'package:AA1WhatsApp/features/auth/viewmodel/auth_userviewmodel.dart';

import 'package:AA1WhatsApp/features/call/repository/call_repository.dart';
import 'package:AA1WhatsApp/model/call/call.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';


final callControllerProvider = Provider((ref) {
  final callRepository = ref.read(callRepositoryProvider);
  return CallController(
    callRepository: callRepository,
    auth: FirebaseAuth.instance,
    ref: ref,
  );
});

class CallController {
  final CallRepository callRepository;
  final ProviderRef ref;
  final FirebaseAuth auth;
  CallController({
    required this.callRepository,
    required this.ref,
    required this.auth,
  });

  Stream<DocumentSnapshot> get callStream => callRepository.callStream;

  void CreateCall(BuildContext context, String receiverName, String receiverUid,
      String receiverProfilePic, bool isGroupChat) {
    ref.read(userDataAuthProvider).whenData((value) {
      String callId = const Uuid().v1();
      Call senderCallData = Call(
        callerId: auth.currentUser!.uid,
        callerName: value!.name,
        callerPic: value.profile,
        receiverId: receiverUid,
        receiverName: receiverName,
        receiverPic: receiverProfilePic,
        callId: callId,
        hasDialled: true, timestamp: DateTime.now(),
      );

      Call recieverCallData = Call(
        callerId: auth.currentUser!.uid,
        callerName: value.name,
        callerPic: value.profile,
        receiverId: receiverUid,
        receiverName: receiverName,
        receiverPic: receiverProfilePic,
        callId: callId,
        hasDialled: false, timestamp: DateTime.now(),
      );
      if (isGroupChat) {
        callRepository.makeGroupCall(senderCallData, context, recieverCallData);
      } else {
        callRepository.CreateCall(senderCallData, recieverCallData,context);
      }
    });
  }

  void endCall(
      String callerId,
      String receiverId,
      BuildContext context,
      ) {
    callRepository.endCall(callerId, receiverId, context);
  }
  Stream<List<Call >>getStreamCalls(){
   return callRepository.getStreamCalls();
  }

  void deletcall(String cureentuser){
    callRepository.deletcall(cureentuser);
  }
}
//