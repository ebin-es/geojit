import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_dev/util_widgets/custom_text_field.dart';
import '../../../themes/text_styles.dart';
import '../../../util_widgets/custom_button.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: Image.asset("lib/assets/icons/app_icon.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "GeoJit",
                    style: splashHeading,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 50),
                  child: Text(
                    "Login using your credentials",
                    style: normalText1,
                  ),
                ),
                GetBuilder<LoginController>(builder: (controller) {
                  return CustomTextField(
                    labelText: "Enter Email or Phone",
                    hintText: "example@gmail.com",
                    onChanged: (value) {},
                    textController: loginController.emailController,
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.person),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        loginController.clearText(0);
                      },
                      icon: const Icon(
                        Icons.clear_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<LoginController>(builder: (controller) {
                  return CustomTextField(
                    labelText: "Enter Password",
                    hintText: "Password",
                    onChanged: (value) {},
                    obscureText:
                        loginController.getPassVisibility ? true : false,
                    maxLength: 16,
                    textController: loginController.passController,
                    prefixIcon: IconButton(
                      onPressed: () {
                        loginController.toggleVisibility();
                      },
                      icon: Icon(
                        Icons.visibility,
                        color: loginController.getPassVisibility
                            ? Colors.grey
                            : Colors.green,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        loginController.clearText(1);
                      },
                      icon: const Icon(
                        Icons.clear_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    loginController.validate();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
