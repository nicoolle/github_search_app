import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ledsdoit/constants/app_colors.dart';

class RepositoryTileWidget extends StatelessWidget {
  final void Function() onPressed;
  final String repositoryName;
  final bool isFavorite;

  const RepositoryTileWidget(
      {super.key,
      required this.onPressed,
      required this.repositoryName,
      required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListTile(
        title: Text(repositoryName),
        trailing: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/favorite_icon.svg',
            colorFilter: isFavorite
                ? const ColorFilter.mode(
                    AppColors.blue,
                    BlendMode.srcIn,
                  )
                : null,
          ),
          onPressed: onPressed,
        ),

      ),
    );
  }
}
