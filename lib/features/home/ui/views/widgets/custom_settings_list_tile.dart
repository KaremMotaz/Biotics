import '../../../../../core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSettingsListTile extends StatelessWidget {
  const CustomSettingsListTile({
    super.key,
    required this.iconcolor,
    required this.bgIconcolor,
    required this.title,
    required this.onTap,
    required this.trailing,
    required this.icon,
  });
  final Color iconcolor;
  final Color bgIconcolor;
  final String title;
  final VoidCallback onTap;
  final Widget trailing;
  final IconData icon;

  @override

  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
        decoration: BoxDecoration(
          color: bgIconcolor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18.w,
          color: iconcolor,
        ),
      ),
      title: Text(title, style: TextStyles.bold18),
      trailing: trailing,
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
