import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final Rx<File?> profileImage = Rx<File?>(null);

  @override
  void onInit() async {
    super.onInit();
    final prefs = await SharedPreferences.getInstance();
    usernameController.text = prefs.getString('username') ?? 'admin';
    passwordController.text = prefs.getString('password') ?? 'Pass@123';

    final path = prefs.getString('profileImagePath');
    if (path != null) {
      profileImage.value = File(path);
    }
  }

  void pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profileImagePath', pickedFile.path);
    }
  }

  Future<void> saveProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', usernameController.text);
    await prefs.setString('password', passwordController.text);
    Get.snackbar('Success', 'Profile updated successfully',
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> clearProfile() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('username');
  await prefs.remove('password');
  await prefs.remove('profileImagePath');

  usernameController.text = 'admin';
  passwordController.text = 'Pass@123';
  profileImage.value = null;

  Get.snackbar('Reset', 'Profile data cleared',
      snackPosition: SnackPosition.BOTTOM);
}

}
