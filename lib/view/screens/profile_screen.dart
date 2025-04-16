// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:logiology_project/controller/getx/profile_controller.dart';

// class ProfileScreen extends StatelessWidget {
//   final ProfileController controller = Get.find();

//    ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Profile')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Obx(() => CircleAvatar(
//                     radius: 50,
//                     backgroundImage: controller.profileImage.value != null
//                         ? FileImage(controller.profileImage.value!)
//                         : null,
//                     child: controller.profileImage.value == null
//                         ? const Icon(Icons.person, size: 50)
//                         : null,
//                   )),
//               const SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.camera_alt),
//                     onPressed: () => controller.pickImage(ImageSource.camera),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.photo),
//                     onPressed: () => controller.pickImage(ImageSource.gallery),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: controller.usernameController,
//                 decoration: const InputDecoration(labelText: 'Username'),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: controller.passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(labelText: 'Password'),
//               ),
//               const SizedBox(height: 32),
//               ElevatedButton(
//                 onPressed: controller.saveProfile,
//                 child: const Text('Save Changes'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logiology_project/controller/getx/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.find();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(() => Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: controller.profileImage.value != null
                            ? FileImage(controller.profileImage.value!)
                            : null,
                        child: controller.profileImage.value == null
                            ? const Icon(Icons.person,
                                size: 55, color: Colors.grey)
                            : null,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueAccent,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: PopupMenuButton<ImageSource>(
                          onSelected: controller.pickImage,
                          icon: const Icon(Icons.edit,
                              size: 20, color: Colors.white),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: ImageSource.camera,
                              child: Row(
                                children: [
                                  Icon(Icons.camera_alt, size: 18),
                                  SizedBox(width: 8),
                                  Text('Camera'),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: ImageSource.gallery,
                              child: Row(
                                children: [
                                  Icon(Icons.photo_library, size: 18),
                                  SizedBox(width: 8),
                                  Text('Gallery'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              const SizedBox(height: 32),

              // Username TextField
              TextField(
                controller: controller.usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 20),

              // Password TextField
              TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 30),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: controller.saveProfile,
                  icon: const Icon(Icons.save),
                  label: const Text('Save Changes'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.blueAccent,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
