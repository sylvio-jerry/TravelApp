import 'package:flutter/material.dart';
import 'package:travel/app/shared/themes/app_color.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon, required this.onPressed,
  });
  final IconData icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 44,
        height: 44,
        decoration:
            BoxDecoration(color: AppColor.grayColor, shape: BoxShape.circle),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
        ));
  }
}