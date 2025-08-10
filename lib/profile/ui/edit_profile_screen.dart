import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_clone/constants/color_constants.dart';

import '../../constants/assets_path_constants.dart';
import '../../utils/common_textstyles.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      appBar: _appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 3.h),
          Center(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  height: 17.h,
                  width: 37.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.teal,
                    image: DecorationImage(
                      image: AssetImage(ImagePathConstants.profileImage),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: _changeProfilePhotoDialog,
                    child: Container(
                      height: 4.h,
                      width: 9.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.edit_outlined,
                        size: 2.7.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    'Name',
                    style: CommonTextStyles.bold(12.spa, CustomColors.whiteTextColor)
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    style: CommonTextStyles.bold(12.spa, CustomColors.whiteTextColor),
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: "Your name",
                      hintStyle: CommonTextStyles.bold(12.spa, CustomColors.greyTextColor),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _nameController.clear(),
                  child: Icon(Icons.close,
                  size: 2.h,
                  color: CustomColors.whiteTextColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.h),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: CustomColors.bgGreyColor, width: 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _changeProfilePhotoDialog () {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: CustomColors.bgDialogColor,
          title: Text('Change profile photo',
              style: CommonTextStyles.medium(16.spa, CustomColors.blackTextColor)),
          content: SizedBox(
            width: 90.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1.h),
                Text('Choose photo',
                    style: CommonTextStyles.regular(13.spa, CustomColors.blackTextColor)),
                SizedBox(height: 3.h),
                Text('Take photo',
                    style: CommonTextStyles.regular(13.spa, CustomColors.blackTextColor)),
                SizedBox(height: 3.h),
                Text('Remove current photo',
                    style: CommonTextStyles.regular(13.spa, CustomColors.blackTextColor)),
                SizedBox(height: 3.h),
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: CustomColors.bgColor,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: 3.5.h,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Edit Profile',
        style: CommonTextStyles.bold(13.spa, CustomColors.whiteTextColor),
      ),
      actions: [
        Text(
          'Save',
          style: CommonTextStyles.regular(13.spa, CustomColors.greyTextColor),
        ),
        SizedBox(width: 3.w),
      ],
    );
  }
}
