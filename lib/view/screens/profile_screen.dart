// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:logiology_project/controller/getx/profile_controller.dart';

// class ProfileScreen extends StatelessWidget {
//   final ProfileController controller = Get.find();

//   ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text('Profile'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Container(
//           padding: const EdgeInsets.all(24),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.15),
//                 blurRadius: 10,
//                 offset: const Offset(0, 6),
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Obx(() => Stack(
//                     alignment: Alignment.bottomRight,
//                     children: [
//                       CircleAvatar(
//                         radius: 55,
//                         backgroundColor: Colors.grey[200],
//                         backgroundImage: controller.profileImage.value != null
//                             ? FileImage(controller.profileImage.value!)
//                             : null,
//                         child: controller.profileImage.value == null
//                             ? const Icon(Icons.person,
//                                 size: 55, color: Colors.grey)
//                             : null,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.blueAccent,
//                           border: Border.all(color: Colors.white, width: 2),
//                         ),
//                         child: PopupMenuButton<ImageSource>(
//                           onSelected: controller.pickImage,
//                           icon: const Icon(Icons.edit,
//                               size: 20, color: Colors.white),
//                           itemBuilder: (context) => [
//                             const PopupMenuItem(
//                               value: ImageSource.camera,
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.camera_alt, size: 18),
//                                   SizedBox(width: 8),
//                                   Text('Camera'),
//                                 ],
//                               ),
//                             ),
//                             const PopupMenuItem(
//                               value: ImageSource.gallery,
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.photo_library, size: 18),
//                                   SizedBox(width: 8),
//                                   Text('Gallery'),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   )),
//               const SizedBox(height: 32),

//               // Username TextField
//               TextField(
//                 controller: controller.usernameController,
//                 decoration: InputDecoration(
//                   labelText: 'Username',
//                   prefixIcon: const Icon(Icons.person),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[100],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Password TextField
//               TextField(
//                 controller: controller.passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   prefixIcon: const Icon(Icons.lock),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[100],
//                 ),
//               ),
//               const SizedBox(height: 30),

//               // Save Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton.icon(
//                   onPressed: () {
//                     controller.saveProfile();
//                     Get.back();
//                   },
//                   icon: const Icon(Icons.save),
//                   label: const Text('Save Changes'),
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     backgroundColor: Colors.blueAccent,
//                     textStyle: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   Get.defaultDialog(
//                     title: 'Confirm Reset',
//                     middleText:
//                         'Are you sure you want to clear your profile data?',
//                     textConfirm: 'Yes',
//                     textCancel: 'No',
//                     confirmTextColor: Colors.white,
//                     onConfirm: () {
//                       controller.clearProfile();
//                       Get.back();
//                     },
//                   );
//                 },
//                 icon: const Icon(Icons.restore),
//                 label: const Text('Reset Profile'),
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
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
      backgroundColor: const Color(0xFFF2F4F6),
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Obx(() => Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: controller.profileImage.value != null
                            ? FileImage(controller.profileImage.value!)
                            : null,
                        child: controller.profileImage.value == null
                            ? const Icon(Icons.person,
                                size: 60, color: Colors.grey)
                            : null,
                      ),
                    ),
                    Positioned(
                      bottom: 6,
                      right: 6,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueAccent,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: PopupMenuButton<ImageSource>(
                          onSelected: controller.pickImage,
                          icon: const Icon(Icons.edit,
                              size: 18, color: Colors.white),
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
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 32),

            TextField(
              controller: controller.usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: const Icon(Icons.person),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  controller.saveProfile();
                  Get.back();
                },
                icon: const Icon(Icons.save),
                label: const Text('Save Changes'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Confirm Reset',
                    middleText:
                        'Are you sure you want to clear your profile data?',
                    textConfirm: 'Yes',
                    textCancel: 'No',
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      controller.clearProfile();
                      Get.back();
                    },
                  );
                },
                icon: const Icon(Icons.restore),
                label: const Text('Reset Profile'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Colors.red),
                  foregroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
