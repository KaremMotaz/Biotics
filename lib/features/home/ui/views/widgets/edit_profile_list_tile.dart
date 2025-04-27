import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';

class EditProfileListTile extends StatelessWidget {
  const EditProfileListTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
    required this.subTitle,
  });
  final String title;
  final Widget subTitle;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24.w,
      ),
      title: Text(
        title,
        style: TextStyles.bold16,
      ),
      subtitle: subTitle,
      trailing: IconButton(
        onPressed: onTap,
        icon: const Icon(Icons.chevron_right_rounded),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
