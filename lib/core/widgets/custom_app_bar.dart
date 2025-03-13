import 'package:biocode/core/theming/styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyles.bold20.copyWith(),
    ),
    centerTitle: true,
  );
}
