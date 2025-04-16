import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology_project/controller/getx/auth_controller.dart';
import 'package:logiology_project/controller/getx/product_controller.dart';
import 'package:logiology_project/controller/getx/profile_controller.dart';
import 'package:logiology_project/view/screens/home_screen.dart';
import 'package:logiology_project/view/screens/login_screen.dart';
import 'package:logiology_project/view/screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());
  Get.put(ProfileController());
  Get.put(ProductController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => LoginScreen(),
            binding: BindingsBuilder(() => Get.put(AuthController()))),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        // GetPage(name: '/prodct details', page: () => ProductDetailsScreen(product: Get.arguments,)),
      
      ],
      home: LoginScreen(),
    );
  }
}
