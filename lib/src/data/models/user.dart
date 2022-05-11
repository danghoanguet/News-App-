import 'package:get/get.dart';

class User {
  final String userName;
  final String uid;
  final String password;
  final String email;


  User( {required this.email,required this.userName,required this.uid,required this.password});
}

class UserController extends GetxController {
  var users = <User>[].obs;

  void addNewUser(User user) {
    final result = checkUserExited(user.email);
    if (result == false) {
      users.add(user);
    }
  }

    bool checkUserExited(String email) {
      for (var element in users) {
        if(element.email == email) {
          return true;
        }
      }
      return false;
    }
  }
