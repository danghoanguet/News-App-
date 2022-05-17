import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import '../../../data/models/user.dart';
import '../../app_routes.dart';

class SignInController extends GetxController {
  var isAuthenticated = false.obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var userNameController = TextEditingController().obs;
  var emailFocusNode = FocusNode().obs;
  var userNameFocusNode = FocusNode().obs;
  var passwordFocusNode = FocusNode().obs;
  var isUseNameEmpty = true.obs;
  var isEmailEmpty = true.obs;
  var isSubmit = false.obs;
  var isSignUp = true.obs;
  var isObscureText = true.obs;
  final formKey = GlobalKey<FormState>();

  String? Function(String?) emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    MinLengthValidator(6, errorText: 'Email must be atleast 6 characters'),
    EmailValidator(errorText: 'Please enter vaild email'),
  ]);

  String? Function(String?) passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(6, errorText: 'Password must be atleast 6 characters'),
  ]);

  String? Function(String?) userNameValidator = MultiValidator([
    RequiredValidator(errorText: 'User name is required'),
    MinLengthValidator(6, errorText: 'User name must be atleast 6 characters'),
  ]);

  void signUp() {
    isSubmit.value = true;
    if (formKey.currentState!.validate()) {
      final _userController = Get.find<UserController>();
      final result =
          _userController.checkUserExited(emailController.value.text);
      print(result);
      if (result == false) {
        isAuthenticated.value = true;
        _userController.addNewUser(User(
            email: emailController.value.text,
            userName: userNameController.value.text,
            uid: DateTime.now().toIso8601String(),
            password: passwordController.value.text));
        Get.toNamed('/home',
            arguments: {'username': userNameController.value.text});
      } else {
        Get.snackbar(
          "Sign up failed",
          "Email already been used, please use another one",
          icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
        );
      }
    }
  }

  void onChange() {
    if (isSubmit.value == true) {
      formKey.currentState!.validate();
      if (userNameController.value.text.isNotEmpty) {
        isUseNameEmpty.value = false;
      } else {
        isUseNameEmpty.value = true;
      }
      if (emailController.value.text.isNotEmpty) {
        isEmailEmpty.value = false;
      } else {
        isEmailEmpty.value = true;
      }
    } else {
      if (userNameController.value.text.isNotEmpty) {
        isUseNameEmpty.value = false;
      } else {
        isUseNameEmpty.value = true;
      }
      if (emailController.value.text.isNotEmpty) {
        isEmailEmpty.value = false;
      } else {
        isEmailEmpty.value = true;
      }
    }
  }

  void logIn() {
    isSubmit.value = true;
    if (formKey.currentState!.validate()) {
      final _userController = Get.find<UserController>();
      final reslut =
          _userController.checkUserExited(emailController.value.text);
      if (reslut == true) {
        isAuthenticated.value = true;
        Get.toNamed(AppRoutes.home,
            arguments: {'username': emailController.value.text});
      } else {
        Get.snackbar(
          "Log in failed",
          "No user found",
          icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
        );
      }
    }
  }

  void toggleSignUp() {
    isSubmit.value = false;
    isUseNameEmpty.value = true;
    isEmailEmpty.value = true;
    emailController.value.clear();
    passwordController.value.clear();
    userNameController.value.clear();
    isSignUp.value = !isSignUp.value;
  }

  void toggleObscureText() {
    isObscureText.value = !isObscureText.value;
  }

  void clearEmail() {
    isEmailEmpty.value = true;
    emailController.value.clear();
  }

  void clearUserName() {
    isUseNameEmpty.value = true;
    userNameController.value.clear();
  }

  void unFocus() {
    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      userNameFocusNode.value.unfocus();
      emailFocusNode.value.unfocus();
      passwordFocusNode.value.unfocus();
    }
  }

  Widget passwordSuffixIcon() {
    return GestureDetector(
      onTap: toggleObscureText,
      child: isObscureText.value
          ? const Icon(Icons.remove_red_eye)
          : const Icon(Icons.remove_red_eye_outlined),
    );
  }

  Widget? emailSuffixIcon() {
    return isEmailEmpty.value == true
        ? null
        : GestureDetector(onTap: clearEmail, child: Icon(Icons.clear));
  }

  Widget? userNameSuffixIcon() {
    return isUseNameEmpty.value == true
        ? null
        : GestureDetector(onTap: clearUserName, child: Icon(Icons.clear));
  }
}
