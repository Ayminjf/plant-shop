import 'package:flutter/material.dart';
import 'package:plant_shop/constants/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Container(
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor.withOpacity(0.5),
                  width: 5,
                ),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage("assets/images/profile.jpg"),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "ساناز امینی",
                  style: TextStyle(
                    color: Constants.greyColor,
                    fontSize: 20,
                    fontFamily: "byekan",
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  height: 20,
                  child: Image.asset("assets/images/verified.png"),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              "sanazamini@gmail.com",
              style: TextStyle(
                color: Constants.greyColor.withOpacity(0.5),
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
