import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../Home/home_screen.dart';
import 'BottomNavBarWidgets/Cart/cart_screen.dart';
import 'BottomNavBarWidgets/Chats/chat_screen.dart';
import 'BottomNavBarWidgets/Contact/contact_screen.dart';

class BottomBarView extends GetxController {
  RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeScreen(),
    ContactScreen(),
    ChatScreen(),
    CartScreen(),
    Container(),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
