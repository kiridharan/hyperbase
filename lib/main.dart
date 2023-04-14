import 'package:blockchain/view/pages/home/home_page.dart';
import 'package:blockchain/view/pages/login/signup_page.dart';
import 'package:blockchain/view/pages/navigation/sidebar.dart';
import 'package:blockchain/view/pages/network/create_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/pages/login/login_page.dart';
import 'view/pages/network/default_network.dart';

void main() => runApp(const GetMaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'HyperBASE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      home: const SideBar(),
      routes: {
        "": (context) => const SideBar(),
        "/login": (context) => const LoginView(),
        "/signup": (context) => const SignUpView(),
        "/Home": (context) => const HomePage(),
        "createNetwork": (context) => const CreateNode(),
        "defaultNetwork": (context) => const DefaultNetworkUp(),
      },
    );
  }
}
