import 'package:flutter/material.dart';
import 'package:plant_shop/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  width: size.width * 0.9,
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    right: 15,
                    left: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.mic,
                            color: Constants.greyColor,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: TextField(
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: "iranSans",
                            fontSize: 14.0,
                          ),
                          showCursor: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 10),
                            border: InputBorder.none,
                            hintText: ". . . جستجو",
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.search, color: Constants.greyColor),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
