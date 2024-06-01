import 'package:flutter/material.dart';
import 'package:ledsdoit/constants/app_colors.dart';

class EmptyDataMessageWidget extends StatelessWidget {
  final String message;

  const EmptyDataMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      message,
      textAlign: TextAlign.center,
      style: const TextStyle(color: AppColors.grey),
    ));
  }
}
