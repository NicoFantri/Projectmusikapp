import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/app/modules/home/views/home_view.dart';
import 'package:musicapp/app/modules/home/views/login_view.dart';
//import 'package:musicapp/app/modules/home/views/profile_view.dart';
 // Import LoginView

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Music App',
      initialRoute: '/login', // Set initial route ke halaman login
      getPages: [
        GetPage(name: '/login', page: () => LoginView()), // Halaman Login
        GetPage(name: '/home', page: () => HomeView()), // Halaman Home
        //GetPage(name: '/profile', page: () => const ProfileView()), // Halaman Profile
        // Tambahkan lebih banyak halaman jika diperlukan
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
