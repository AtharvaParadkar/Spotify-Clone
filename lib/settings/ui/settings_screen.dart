import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_clone/constants/color_constants.dart';
import 'package:spotify_clone/dashboard/ui/dashboard_bottom_nav_bar.dart';
import 'package:spotify_clone/routes/routes.dart';
import 'package:spotify_clone/utils/common_textstyles.dart';
import 'package:spotify_clone/utils/shared_prefs.dart';

import '../bloc/settings_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsBloc _bloc = SettingsBloc();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is LogOutSuccessState) {
          Navigator.pushNamed(context, RouteConstants.loginScreen);
          SharedPreferenceHelper.instance.setLogin(false);
        }
      },
      child: Scaffold(
        backgroundColor: CustomColors.bgColor,
        bottomNavigationBar: DashboardBottomNavBar(),
        appBar: AppBar(
          backgroundColor: CustomColors.bgDrawerColor,
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 3.5.h,
            ),
          ),
          title: Text(
            'Settings',
            style:
                CommonTextStyles.extrabold(13.spa, CustomColors.whiteTextColor),
          ),
          actions: [
            Icon(
              Icons.search_rounded,
              color: Colors.white,
              size: 3.5.h,
            ),
            SizedBox(width: 3.w),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              listTileWidget(() {}, Icons.account_circle_outlined, "Account",
                  "Username \u2022 Close account"),
              listTileWidget(() {}, Icons.music_note, "Content and display",
                  "Languages for music \u2022 App language"),
              listTileWidget(() {}, Icons.volume_up_outlined, "Playback",
                  "Gapless playback \u2022 Autoplay"),
              listTileWidget(() {}, Icons.lock_outline, "Privacy and social",
                  "Recently played artists \u2022 Public playlists"),
              listTileWidget(() {}, Icons.notifications, "Notifications",
                  "Push \u2022 Email"),
              listTileWidget(
                  () {},
                  Icons.devices_other_sharp,
                  "Apps and devices",
                  "Google Maps \u2022 Spotify Connect control"),
              listTileWidget(() {}, Icons.download_for_offline_outlined,
                  "Data-saving and offline", "Date Saver \u2022 Offline mode"),
              listTileWidget(() {}, Icons.equalizer, "Media quality",
                  "Wi-Fi streaming quality \u2022 Cellular streaming\nquality"),
              listTileWidget(() {}, Icons.info_outline, "About",
                  "Version \u2022 Privacy Policy"),
              SizedBox(height: 1.h),
              ElevatedButton(
                onPressed: () => _bloc.add(LogOutEvent()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.whiteTextColor,
                  fixedSize: Size(30.w, 3.h),
                ),
                child: Text(
                  'Log out',
                  style: CommonTextStyles.bold(
                      12.spa, CustomColors.blackTextColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listTileWidget(
      VoidCallback onTap, IconData icon, String text, String subText) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        child: Row(
          children: [
            Icon(
              icon,
              size: 3.5.h,
              color: CustomColors.whiteTextColor,
            ),
            SizedBox(width: 3.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: CommonTextStyles.regular(
                      12.spa, CustomColors.whiteTextColor),
                ),
                Text(
                  subText,
                  style: CommonTextStyles.regular(
                      11.spa, CustomColors.greyTextColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
