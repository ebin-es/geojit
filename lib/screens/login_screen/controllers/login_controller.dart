import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_dev/constants/constants.dart';
import 'package:learn_dev/util_widgets/dialog_util.dart';
import '../../home_screen/views/home_screen.dart';

class LoginController extends GetxController {

  //initialising all variables..
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool passVisible = true;
  bool get getPassVisibility => passVisible;

  //Function to validate the data entered in login page..
  // The condition is set in a way to allow access to home page if and only if
  //the user provides valid credentials.

  void validate() {
    if (emailController.text.isEmpty) {
      DialogUtils.showSnack("Please enter a valid email to continue");
    } else if (passController.text.isEmpty) {
      DialogUtils.showSnack("Please enter a valid password to continue");
    } else if (emailController.text == BasicCredentials.userName &&
        passController.text == BasicCredentials.password) {
      //if the credentials are matched, user will be navigated to Home page..
      Get.offAll(() => HomeScreen());
    } else {
      DialogUtils.showSnack("Invalid credentials");
    }
  }

  //This function is used to toggle password visibility..
  void toggleVisibility() {
    passVisible = passVisible ? passVisible = false : passVisible = true;
    update();
  }

  //This function is used to clear input fields based on condition..
  void clearText(int val) {
    if (val == 0) {
      emailController.clear();
    } else {
      passController.clear();
    }
    update();
  }
}
