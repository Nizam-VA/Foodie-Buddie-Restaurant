import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/core/constants.dart';
import 'package:foodiebuddierestaurant/view/screen/forgot_password/screen_forgot_password.dart';
import 'package:foodiebuddierestaurant/view/widgets/button_widget.dart';
import 'package:foodiebuddierestaurant/view/widgets/text_button_widget.dart';
import 'package:foodiebuddierestaurant/view/widgets/text_field_widget.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(24),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHight100,
            const Text('Welcome',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const Text('Login to your account', style: TextStyle(fontSize: 18)),
            kHight30,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldWidget(
                  userController: userController,
                  validator: (value) {
                    const pattern =
                        r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                    final regex = RegExp(pattern);

                    return value!.isEmpty || !regex.hasMatch(value)
                        ? 'Enter a valid email address'
                        : null;
                  },
                  label: 'Email-address:',
                  inputType: TextInputType.emailAddress,
                  obscureText: false,
                ),
                kHight10,
                TextFieldWidget(
                  userController: passController,
                  validator: (value) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    }
                  },
                  label: 'Password:',
                  inputType: TextInputType.name,
                  obscureText: true,
                ),
                kHight10,
                TextButtonWidget(
                  width: width,
                  text: 'Forgot password?',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ScreenForgotPassword(),
                      ),
                    );
                  },
                ),
                kHight10,
                ButtonWidget(
                  width: width,
                  text: 'Login',
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
