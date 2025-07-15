import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_clone/constants/color_constants.dart';
import 'package:spotify_clone/routes/routes.dart';
import 'package:spotify_clone/utils/common_textstyles.dart';

import '../../constants/assets_path_constants.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({super.key});

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: CustomColors.bgDrawerColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () => Navigator.popAndPushNamed(context, RouteConstants.viewProfileScreen),
                child: SizedBox(
                  height: 10.h,
                  child: DrawerHeader(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(0),
                            margin: EdgeInsets.all(0),
                            height: 6.h,
                            width: 13.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(ImagePathConstants.profileImage),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Atharva',style: CommonTextStyles.bold(14.spa, CustomColors.whiteTextColor),),
                              Text('View profile',style: CommonTextStyles.light(11.spa, CustomColors.whiteTextColor),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.add_circle_outline,size: 3.h,),
              title: Text('Add account',style: CommonTextStyles.bold(13.spa, CustomColors.whiteTextColor),),
              textColor: CustomColors.whiteTextColor,
              iconColor: CustomColors.whiteTextColor,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.electric_bolt,size: 3.h,),
              title: Text('What\'s new',style: CommonTextStyles.bold(13.spa, CustomColors.whiteTextColor),),
              textColor: CustomColors.whiteTextColor,
              iconColor: CustomColors.whiteTextColor,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.graphic_eq,size: 3.h,),
              title: Text('Your Sound Capsule',style: CommonTextStyles.bold(13.spa, CustomColors.whiteTextColor),),
              textColor: CustomColors.whiteTextColor,
              iconColor: CustomColors.whiteTextColor,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.history,size: 3.h,),
              title: Text('Recents',style: CommonTextStyles.bold(13.spa, CustomColors.whiteTextColor),),
              textColor: CustomColors.whiteTextColor,
              iconColor: CustomColors.whiteTextColor,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.notifications_outlined,size: 3.h,),
              title: Text('Your Updates',style: CommonTextStyles.bold(13.spa, CustomColors.whiteTextColor),),
              textColor: CustomColors.whiteTextColor,
              iconColor: CustomColors.whiteTextColor,
            ),
            ListTile(
              onTap: () => Navigator.popAndPushNamed(context, RouteConstants.settingsScreen),
              leading: Icon(Icons.settings_outlined,size: 3.h,),
              title: Text('Settings and privacy',style: CommonTextStyles.bold(13.spa, CustomColors.whiteTextColor),),
              textColor: CustomColors.whiteTextColor,
              iconColor: CustomColors.whiteTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
