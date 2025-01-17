
import 'dart:io';

import 'package:AA1WhatsApp/features/welcome/screans/landing_screan.dart';
import 'package:AA1WhatsApp/model/user_model/user_model.dart';
import 'package:AA1WhatsApp/responsive/mobile_screen_Layout.dart';
import 'package:AA1WhatsApp/responsive/responsive.dart';
import 'package:AA1WhatsApp/responsive/web_screen_Layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';

final UserDateProvider = StateNotifierProvider<authCurentUser, AsyncValue<UserModel?>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authCurentUser(authRepository: authRepository);
});




class authCurentUser extends StateNotifier<AsyncValue<UserModel>>  {


  final AuthRepository authRepository;
  //final ProviderRef ref;

  authCurentUser( {required this.authRepository,
    //required this.ref

  }):super(const AsyncValue.loading());
  Future<void> getCurentUserData() async {
    state = const AsyncValue.loading(); // تعيين حالة التحميل
    try {
      final userData = await authRepository.getCurentUserData();
      state = AsyncValue.data(userData!); // تعيين حالة النجاح مع البيانات
    } catch (e) {
    //  state = AsyncValue.error(e.toString()); // تعيين حالة الخطأ
    }
  }





}






