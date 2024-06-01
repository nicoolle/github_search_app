import 'package:flutter/cupertino.dart';
import 'package:ledsdoit/constants/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final Widget icon;

  const ButtonWidget({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: icon,
      ),
    );
  }
}
