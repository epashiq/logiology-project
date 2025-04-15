import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final Rx<File?> profileImage = Rx<File?>(null);

  void pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }

  void saveProfile() {
    final username = usernameController.text;
    final password = passwordController.text;
    Get.snackbar('Profile Updated', 'Username and password changed successfully', snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}