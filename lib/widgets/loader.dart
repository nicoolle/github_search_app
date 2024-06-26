import 'package:flutter/material.dart';
import 'package:ledsdoit/constants/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.hexagonDots(
            color: AppColors.grey, size: 26));
  }
}
