import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/core/constants.dart';
import 'package:foodiebuddierestaurant/view/screen/confirmation/screen_confirmation.dart';
import 'package:foodiebuddierestaurant/view/widgets/button_widget.dart';
import 'package:foodiebuddierestaurant/view/widgets/text_field_widget.dart';

class ScreenProof extends StatelessWidget {
  ScreenProof({super.key});

  final licenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHight30,
              const Text('Merchant Proof',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const Text('Please attach your restaurant license:',
                  style: TextStyle(fontSize: 18)),
              kHight20,
              InkWell(
                child: Container(
                  width: width,
                  height: height * .2,
                  decoration: BoxDecoration(
                    border: Border.all(width: .5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.photo_camera),
                      Text('Add image')
                    ],
                  ),
                ),
              ),
              kHight20,
              Row(
                children: [
                  Container(
                    width: width * .41,
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide())),
                  ),
                  const SizedBox(width: 5),
                  const Text('or'),
                  const SizedBox(width: 5),
                  Container(
                    width: width * .41,
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide())),
                  ),
                ],
              ),
              kHight20,
              TextFieldWidget(
                userController: licenseController,
                validator: (value) {
                  if (value!.length != 12) {
                    return 'License id must be of 12 digit';
                  } else {
                    return null;
                  }
                },
                label: 'Enter your license number: ',
                inputType: TextInputType.name,
                obscureText: false,
              ),
              kHight20,
              Container(
                alignment: Alignment.center,
                child: ButtonWidget(
                  width: width,
                  text: 'Upload',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ScreenConfirmation(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
