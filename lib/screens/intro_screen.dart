import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {},
              child: const SizedBox(
                width: 60,
                child: Center(
                  child: Text(
                    " رد کردن ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "lalezar",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
