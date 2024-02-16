import 'package:flutter/material.dart';
import 'package:plant_shop/constants/constants.dart';

class BuildOptions extends StatelessWidget {
  final IconData icon;
  final String title;

  const BuildOptions({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Constants.greyColor.withOpacity(0.6),
          ),
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Constants.greyColor,
                  fontFamily: "iranSans",
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                icon,
                color: Constants.greyColor.withOpacity(0.8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
