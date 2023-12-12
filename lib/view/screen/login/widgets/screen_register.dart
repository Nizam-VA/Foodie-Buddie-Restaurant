import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/controller/api_services/authentication/api_calls.dart';
import 'package:foodiebuddierestaurant/model/restaurant.dart';
import 'package:foodiebuddierestaurant/utils/constants.dart';
import 'package:foodiebuddierestaurant/view/screen/main/screen_main.dart';
import 'package:foodiebuddierestaurant/view/widgets/button_widget.dart';
import 'package:foodiebuddierestaurant/view/widgets/functions/snack_bar.dart';
import 'package:foodiebuddierestaurant/view/widgets/text_field_widget.dart';

class ScreenRegister extends StatelessWidget {
  ScreenRegister({super.key});

  final formKey = GlobalKey<FormState>();
  final hotelNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePassController = TextEditingController();
  final pinCodeController = TextEditingController();
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHight10,
            const Text('Welcome',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const Text('Sign up to your account',
                style: TextStyle(fontSize: 18)),
            kHight20,
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // CircleAvatar(
                  //   radius: 50,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Icon(Icons.add_a_photo),
                  //       const Text('add image')
                  //     ],
                  //   ),
                  // ),
                  kHight10,
                  TextFieldWidget(
                    userController: hotelNameController,
                    validator: (value) {
                      if (value!.isEmpty) return 'Enter your restaurant name';
                    },
                    label: 'Restaurant name:',
                    inputType: TextInputType.name,
                    obscureText: false,
                  ),
                  kHight10,
                  TextFieldWidget(
                    userController: descriptionController,
                    validator: (value) {
                      if (value!.isEmpty) return 'Enter your description';
                    },
                    label: 'Description:',
                    inputType: TextInputType.name,
                    obscureText: false,
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
                  kHight10,
                  TextFieldWidget(
                    userController: pinCodeController,
                    validator: (value) {
                      if (value!.isEmpty) return 'Enter your pin code';
                    },
                    label: 'Pin Code:',
                    inputType: TextInputType.name,
                    obscureText: false,
                  ),
                  kHight10,
                  TextFieldWidget(
                    userController: passwordController,
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
                    inputType: TextInputType.emailAddress,
                    obscureText: true,
                  ),
                  kHight10,
                  TextFieldWidget(
                    userController: rePassController,
                    validator: (value) {
                      if (value!.isEmpty) return 'Re-enter password';
                      if (value != passwordController.text) {
                        return 'Wrong password';
                      }
                    },
                    label: 'Re-enter Password:',
                    inputType: TextInputType.emailAddress,
                    obscureText: true,
                  ),
                  kHight20,
                  ButtonWidget(
                    width: width,
                    text: 'Register',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final restaurantName = hotelNameController.text;
                        final description = descriptionController.text;
                        final email = emailController.text;
                        final pinCode = pinCodeController.text;
                        final password = passwordController.text;
                        final rePassword = rePassController.text;
                        final restaurant = Restaurant(
                          name: restaurantName,
                          description: description,
                          email: email,
                          pinCode: pinCode,
                          password: password,
                          rePassword: rePassword,
                        );
                        final value = await ApiServices().register(restaurant);
                        if (value) {
                          showSnack(
                              context, Colors.green, 'Logged Successfully');
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ScreenMain(),
                            ),
                          );
                        } else {
                          showSnack(context, Colors.red, 'Invalid entries');
                        }
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
