import 'package:flutter/material.dart';
import 'package:plant_shop/constants/constants.dart';
import 'package:plant_shop/models/plant_model.dart';

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
          )
        ],
      ),
    );
  }
}
