// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:logiology_project/controller/getx/auth_controller.dart';
// import 'package:logiology_project/view/widgets/custom_textfield_widget.dart';

// class LoginScreen extends StatelessWidget {
//   final AuthController controller = Get.find();

//   LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Container(
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   blurRadius: 10,
//                   offset: const Offset(0, 5),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Welcome Back!',
//                   style: theme.textTheme.headlineSmall?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   'Please login to continue',
//                   style: theme.textTheme.bodyMedium
//                       ?.copyWith(color: Colors.grey[600]),
//                 ),
//                 const SizedBox(height: 32),

//                 // TextField(
//                 //   controller: controller.usernameController,
//                 //   decoration: InputDecoration(
//                 //     labelText: 'Username',
//                 //     prefixIcon: const Icon(Icons.person),
//                 //     border: OutlineInputBorder(
//                 //       borderRadius: BorderRadius.circular(12),
//                 //     ),
//                 //     filled: true,
//                 //     fillColor: Colors.grey[100],
//                 //   ),
//                 // ),

//                 CustomTextFormField(
//                     controller: controller.usernameController,
//                     label: 'Username',
//                     icon: Icons.person),
//                 const SizedBox(height: 16),

//                 // TextField(
//                 //   controller: controller.passwordController,
//                 //   obscureText: true,
//                 //   decoration: InputDecoration(
//                 //     labelText: 'Password',
//                 //     prefixIcon: const Icon(Icons.lock),
//                 //     border: OutlineInputBorder(
//                 //       borderRadius: BorderRadius.circular(12),
//                 //     ),
//                 //     filled: true,
//                 //     fillColor: Colors.grey[100],
//                 //   ),
//                 // ),
//                 CustomTextFormField(
//                     controller: controller.passwordController,
//                     label: 'Password',
//                     icon: Icons.lock),

//                 const SizedBox(height: 24),

//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: controller.login,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueAccent,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text(
//                       'Login',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Don't have an account?"),
//                     TextButton(
//                       onPressed: () {},
//                       child: const Text('Register'),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology_project/controller/getx/auth_controller.dart';
import 'package:logiology_project/view/widgets/custom_textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  final AuthController controller = Get.find();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F6),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome Back!',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please login to continue',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 32),

                CustomTextFormField(
                  controller: controller.usernameController,
                  label: 'Username',
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),

                CustomTextFormField(
                  controller: controller.passwordController,
                  label: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: controller.login,
                    icon: const Icon(Icons.login),
                    label: const Text('Login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
