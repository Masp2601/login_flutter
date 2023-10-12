import 'package:get/get.dart';
import 'package:latin_food_app/users/models/user.dart';
import 'package:latin_food_app/users/userPreferences/user_preferences.dart';

class CurrentUser extends GetxController {
  final Rx<User> _currentUser = User(1, '', '', '', '', '', '', '', '','').obs;

  User get user => _currentUser.value;

  getUserInfo() async {
    User? getUserInfoFromLocalStorage = await RememberUserPrefs.readUserInfo();
    _currentUser.value = getUserInfoFromLocalStorage!;
  }
}
