import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/profile/profile_bloc.dart';
import 'package:foodiebuddierestaurant/utils/constants.dart';
import 'package:foodiebuddierestaurant/utils/text_styles.dart';
import 'package:foodiebuddierestaurant/view/screen/login/screen_login.dart';
import 'package:foodiebuddierestaurant/view/widgets/app_bar.dart';
import 'package:foodiebuddierestaurant/view/widgets/button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    context.read<ProfileBloc>().add(GetProfileEvent());
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: AppBarWidget(title: 'Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      kHight10,
                      ListTile(
                        // leading: const CircleAvatar(),
                        title: Text(state.profile?.name ?? 'name',
                            style: bigBoldBlack),
                        subtitle: Text(
                          '${state.profile?.email} - ${state.profile?.pinCode}',
                          style: semiBoldGrey,
                        ),
                      ),
                      kHight20,
                      ButtonWidget(
                        width: width,
                        text: 'LOGOUT',
                        onPressed: () async {
                          context
                              .read<BottomNavigationBloc>()
                              .add(BottomNavigationEvent(index: 0));
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.setBool('LOGIN', true);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => ScreenLoginRegister()),
                              (route) => false);
                        },
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }
}
