import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/view/widgets/app_bar.dart';
import 'package:foodiebuddierestaurant/view/widgets/section_header.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: AppBarWidget(title: 'Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              ListTile(
                  leading: const CircleAvatar(),
                  title: const SectionHead(heading: 'Hotel Name'),
                  subtitle: const Text('Mobile Number - email-id'),
                  trailing: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'EDIT',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ))
            ],
          ),
        ));
  }
}
