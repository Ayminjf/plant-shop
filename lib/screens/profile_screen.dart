import 'package:flutter/material.dart';
import 'package:plant_shop/constants/constants.dart';
import 'package:plant_shop/widgets/profile_widget.dart';

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
        padding: const EdgeInsets.all(20),
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
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BuildOptions(icon: Icons.person, title: "پروفایل من"),
                  BuildOptions(icon: Icons.settings, title: "تنظیمات"),
                  BuildOptions(icon: Icons.notifications, title: "اطلاع رسانی"),
                  BuildOptions(icon: Icons.share, title: "شبکه های اجتماعی"),
                  BuildOptions(icon: Icons.logout, title: "خروج"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
