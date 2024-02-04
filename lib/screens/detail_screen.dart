import 'package:flutter/material.dart';
import 'package:plant_shop/constants/constants.dart';
import 'package:plant_shop/models/plant_model.dart';
import 'package:plant_shop/screens/home_screen.dart';

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
            left: 20,
            top: 50,
            right: 20,
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
                            plantData: plantList[widget.platnId].plantName,
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
        ],
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
