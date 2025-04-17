import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username') ?? 'admin';
    final savedPassword = prefs.getString('password') ?? 'Pass@123';

    final username = usernameController.text;
    final password = passwordController.text;

    try {
      if (username == savedUsername && password == savedPassword) {
        Get.offNamed('/home');
        log('Login successful');
      } else {
        Get.snackbar('Error', 'Invalid username or password',
            snackPosition: SnackPosition.BOTTOM);
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
