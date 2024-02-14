import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_shop/constants/constants.dart';
import 'package:plant_shop/models/plant_model.dart';
import 'package:plant_shop/screens/detail_screen.dart';
import 'package:plant_shop/widgets/persian_number.dart';
import 'package:plant_shop/widgets/plant_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<Plant> _plantList = Plant.plantList;

  bool clickIsFavorite(bool isFavorites) => !isFavorites;

  final List<String> _plantsCategory = [
    '| پیشنهادی |',
    '| آپارتمانی |',
    '| محل‌کار |',
    '| گل باغچه‌ایی |',
    '| گل سمی |',
  ];

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
            ),
            Container(
              height: 70,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: _plantsCategory.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      splashColor: Constants.primaryColor.withOpacity(0.2),
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _plantsCategory[index],
                        style: TextStyle(
                          fontFamily: "iranSans",
                          fontSize: 14,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: selectedIndex == index
                              ? Constants.primaryColor
                              : Constants.greyColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: _plantList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child:
                              DetailScreen(platnId: _plantList[index].plantId),
                          type: PageTransitionType.topToBottom,
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Colors.white),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _plantList[index].isFavorated =
                                        clickIsFavorite(
                                            _plantList[index].isFavorated);
                                  });
                                },
                                color: Constants.primaryColor,
                                icon: Icon(
                                  _plantList[index].isFavorated == true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 50,
                            left: 50,
                            top: 50,
                            bottom: 50,
                            child: Image.asset(_plantList[index].imageURL),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 20,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Text(
                                "\$${_plantList[index].price.toString().persianNumber}",
                                style: TextStyle(
                                  color: Constants.primaryColor,
                                  fontSize: 16,
                                  fontFamily: "lalezar",
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _plantList[index].category,
                                  style: const TextStyle(
                                    fontFamily: "byekan",
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  _plantList[index].plantName,
                                  style: const TextStyle(
                                    fontFamily: "byekan",
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(
                right: 20,
                bottom: 15,
                top: 20,
              ),
              child: const Text(
                "گیاهان جدید",
                style: TextStyle(
                  fontFamily: "lalezar",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantList.length,
                itemBuilder: (context, index) {
                  return NewPlantWidget(plantList: _plantList, index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
