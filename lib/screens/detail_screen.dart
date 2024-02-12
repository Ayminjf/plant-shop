import 'package:flutter/material.dart';
import 'package:plant_shop/constants/constants.dart';
import 'package:plant_shop/models/plant_model.dart';
import 'package:plant_shop/widgets/persian_number.dart';

class DetailScreen extends StatefulWidget {
  final int platnId;
  const DetailScreen({
    super.key,
    required this.platnId,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Constants.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    plantList[widget.platnId].isFavorated =
                        !plantList[widget.platnId].isFavorated;
                  }),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Constants.primaryColor.withOpacity(0.15),
                    ),
                    child: plantList[widget.platnId].isFavorated == true
                        ? Icon(
                            Icons.favorite,
                            color: Constants.primaryColor,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: Constants.primaryColor,
                          ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              height: size.height * 0.8,
              width: size.width * 0.8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(
                        plantList[widget.platnId].imageURL,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantDetails(
                            title: "اندازه گیاه",
                            plantData: plantList[widget.platnId].size,
                          ),
                          PlantDetails(
                            title: "رطوبت‌هوا",
                            plantData: plantList[widget.platnId]
                                .humidity
                                .toString()
                                .persianNumber,
                          ),
                          PlantDetails(
                            title: "دمای‌نگهداری",
                            plantData: plantList[widget.platnId]
                                .temperature
                                .persianNumber,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding:
                  const EdgeInsets.only(top: 80.0, left: 30.0, right: 30.0),
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    plantList[widget.platnId].plantName,
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontFamily: "lalezar",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 30,
                            color: Constants.primaryColor,
                          ),
                          Text(
                            plantList[widget.platnId]
                                .rating
                                .toString()
                                .persianNumber,
                            style: TextStyle(
                              fontSize: 23,
                              // fontWeight: FontWeight.bold,
                              color: Constants.primaryColor,
                              fontFamily: "lalezar",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                            child: Image.asset(
                                "assets/images/PriceUnit-green.png"),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            plantList[widget.platnId]
                                .price
                                .toString()
                                .persianNumber,
                            style: TextStyle(
                              fontFamily: "lalezar",
                              color: Constants.blackColor.withOpacity(0.6),
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    plantList[widget.platnId].decription,
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: "iranSans",
                      color: Constants.blackColor.withOpacity(0.6),
                      fontSize: 15,
                      height: 1.7,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50.0,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.0, 1.1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(0.3),
                    )
                  ],
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0.0, 1.1),
                        blurRadius: 5,
                        color: Constants.primaryColor.withOpacity(0.3),
                      )
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "افزودن‌به‌سبد‌خرید",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "lalezar",
                      ),
                    ),
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

class PlantDetails extends StatelessWidget {
  final String title;
  final String plantData;
  const PlantDetails({
    super.key,
    required this.title,
    required this.plantData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.greyColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "lalezar",
          ),
        ),
        Text(
          plantData,
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "lalezar",
          ),
        ),
      ],
    );
  }
}
