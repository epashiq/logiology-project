import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

 Future<void>  login() async{
    final username = usernameController.text;
    final password = passwordController.text;

    try {
      if (username == 'admin' && password == 'Pass@123') {
      Get.offNamed('/home');
      log('login succesfully');
    } else {
      Get.snackbar('Error', 'Invalid username or password', snackPosition: SnackPosition.BOTTOM);
    }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
} 

