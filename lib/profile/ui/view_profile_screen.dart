import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_clone/constants/color_constants.dart';
import 'package:spotify_clone/dashboard/ui/dashboard_bottom_nav_bar.dart';
import 'package:spotify_clone/routes/routes.dart';

import '../../constants/assets_path_constants.dart';
import '../../utils/common_textstyles.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({super.key});

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      bottomNavigationBar: DashboardBottomNavBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 0.05 ,0.5, 1.0],
            colors: [
              CustomColors.bgViewProfileColor,
              CustomColors.bgViewProfileColor,
              CustomColors.bgColor,
              CustomColors.bgColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 2.h,
                left: 4.w,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 3.5.h,
                  ),
                ),
              ),
              Positioned(
                left: 4.w,
                top: 8.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.all(0),
                          height: 14.h,
                          width: 33.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.teal,
                            image: DecorationImage(
                              image: AssetImage(ImagePathConstants.profileImage),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Atharva',
                              style: CommonTextStyles.bold(15.spa, CustomColors.whiteTextColor),
                            ),
                            SizedBox(height: 1.h),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '1',
                                    style: CommonTextStyles.regular(11.spa, CustomColors.whiteTextColor),
                                  ),
                                  TextSpan(
                                    text: ' follower',
                                    style: CommonTextStyles.regular(11.spa, CustomColors.greyTextColor),
                                  ),
                                  TextSpan(
                                    text: ' \u2022 2',
                                    style: CommonTextStyles.regular(11.spa, CustomColors.whiteTextColor),
                                  ),
                                  TextSpan(
                                    text: ' following',
                                    style: CommonTextStyles.regular(11.spa, CustomColors.greyTextColor),
                                  ),
                                ]
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, RouteConstants.editProfileScreen),
                          child: Container(
                            height: 4.5.h,
                            width: 17.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Text(
                              'Edit',
                              style:
                              CommonTextStyles.bold(12.spa, Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        GestureDetector(
                          onTap: _profileOptions,
                          child: Transform.rotate(
                            angle: 90 * 3.1415926535 / 180,
                              child: Icon(Icons.keyboard_control_sharp,
                                  color: CustomColors.greyTextColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _profileOptions() {
    return showModalBottomSheet(
      context: context,
      backgroundColor: CustomColors.bgDrawerColor,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 2.h),
            _profileOptionsRow('Atharva', Icons.add),
            SizedBox(height: 2.h),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: CustomColors.bgGreyColor, width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            _profileOptionsRow('Share', Icons.share_outlined),
            SizedBox(height: 2.h),
            _profileOptionsRow('Preview profile', Icons.remove_red_eye_outlined),
            SizedBox(height: 2.h),
            _profileOptionsRow('Show Spotify Code', Icons.graphic_eq_outlined),
            SizedBox(height: 3.h),
          ],
        );
      },
    );
  }

  _profileOptionsRow (String text, IconData icon) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            text == "Atharva"
            ? Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              height: 6.h,
              width: 13.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.teal,
                image: DecorationImage(
                  image: AssetImage(ImagePathConstants.profileImage),
                  fit: BoxFit.contain,
                ),
              ),
            )
            : Icon(icon,size: 3.h,color: CustomColors.whiteTextColor),
            SizedBox(width: 4.w),
            Text(text,style: CommonTextStyles.bold(13.spa, CustomColors.whiteTextColor),),
          ],
        ),
      ),
    );
  }

}
