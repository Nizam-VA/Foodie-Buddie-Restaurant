import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/core/constants.dart';
import 'package:foodiebuddierestaurant/view/widgets/button_widget.dart';
import 'package:foodiebuddierestaurant/view/widgets/text_field_widget.dart';

class ScreenForgotPassword extends StatelessWidget {
  ScreenForgotPassword({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHight50,
            const Text(
              'Forgot password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            kHight20,
            Text(
              'Enter you E-mail id:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            kHight10,
            TextFieldWidget(
              userController: emailController,
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
              label: 'E-mail id:',
              inputType: TextInputType.emailAddress,
              obscureText: false,
            ),
            kHight20,
            Container(
              alignment: Alignment.center,
              child: ButtonWidget(
                width: width,
                text: 'Send',
                onPressed: () {},
              ),
            )
          ],
        ),
      )),
    );
  }
}
