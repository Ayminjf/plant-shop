import 'package:flutter/material.dart';
import 'package:plant_shop/constants/constants.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

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
      body: Stack(
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              CreatePage(
                title: Constants.titleOne,
                description: Constants.descriptionOne,
                image: "assets/images/plant-one.png",
              ),
              CreatePage(
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
                image: "assets/images/plant-two.png",
              ),
              CreatePage(
                title: Constants.titleThree,
                description: Constants.descriptionThree,
                image: "assets/images/plant-three.png",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const CreatePage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 50,
        right: 50,
        bottom: 80,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(image),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.primaryColor,
              fontFamily: "byekan",
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 35),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontFamily: "iranSans",
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
