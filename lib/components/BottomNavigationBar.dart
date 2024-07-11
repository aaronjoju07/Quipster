import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quipster/pages/Home.dart';


class Bottomnavigationbar extends StatelessWidget {
  final FirebaseAuth auth;

  const Bottomnavigationbar({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController(auth: auth)); 
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.analytics_outlined), label: 'analytics'),
            NavigationDestination(icon: Icon(Icons.search), label: 'search'),
            NavigationDestination(icon: Icon(Icons.account_circle), label: 'Account'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final FirebaseAuth auth;
  final Rx<int> selectedIndex = 0.obs;
  late final List<Widget> screens;

  NavigationController({required this.auth}) {
    screens = [
      Home(auth: auth), 
      Container(color: Colors.blue),
      Container(color: Colors.blueAccent),
      Container(color: Colors.cyan),
    ];
  }
}