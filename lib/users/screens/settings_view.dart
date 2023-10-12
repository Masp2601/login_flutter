import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latin_food_app/users/models/user.dart';
import 'package:latin_food_app/users/userPreferences/current_user.dart';
import 'package:latin_food_app/utils/utils.dart';

class SettingsPage extends StatelessWidget {
  late final User user;
  final CurrentUser _currentUser = Get.put(CurrentUser());
  Widget userInfoItemProfile(IconData iconData, String userData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.black,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            userData,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UI.appBarUI(context, "PERSONAL INFORMATION",
          Color.fromARGB(255, 243, 243, 243), []),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          userInfoItemProfile(Icons.person, _currentUser.user.name!),
          const SizedBox(
            height: 20,
          ),
          userInfoItemProfile(Icons.person, _currentUser.user.lastname!),
          const SizedBox(
            height: 20,
          ),
          userInfoItemProfile(Icons.email, _currentUser.user.email!),
          const SizedBox(
            height: 20,
          ),
          userInfoItemProfile(Icons.money, _currentUser.user.saldo!),
          const SizedBox(
            height: 20,
          ),
          userInfoItemProfile(Icons.location_on, _currentUser.user.address!),
          const SizedBox(
            height: 20,
          ),
          userInfoItemProfile(
              Icons.phone_android_rounded, _currentUser.user.phone!),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
