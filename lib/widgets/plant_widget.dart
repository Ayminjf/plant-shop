import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_shop/constants/constants.dart';
import 'package:plant_shop/models/plant_model.dart';
import 'package:plant_shop/screens/detail_screen.dart';
import 'package:plant_shop/widgets/persian_number.dart';

class NewPlantWidget extends StatelessWidget {
  final int index;
  final List<Plant> _plantList;

  const NewPlantWidget({
    super.key,
    required List<Plant> plantList,
    required this.index,
  }) : _plantList = plantList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: DetailScreen(platnId: _plantList[index].plantId),
            type: PageTransitionType.topToBottom,
          ),
        );
      },
      child: Container(
        height: 80,
        width: size.width,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 20,
                  child: Image.asset("assets/images/PriceUnit-green.png"),
                ),
                const SizedBox(width: 5),
                Text(
                  _plantList[index].price.toString().persianNumber,
                  style: TextStyle(
                      fontFamily: "lalezar",
                      color: Constants.primaryColor,
                      fontSize: 20),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 0,
                  left: 0,
                  child: SizedBox(
                    height: 80,
                    child: Image.asset(_plantList[index].imageURL),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _plantList[index].category,
                        style: const TextStyle(
                          fontFamily: "byekan",
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        _plantList[index].plantName,
                        style: TextStyle(
                          fontFamily: "byekan",
                          fontSize: 18,
                          color: Constants.greyColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
