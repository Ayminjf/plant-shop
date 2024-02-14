import 'package:flutter/material.dart';
import 'package:plant_shop/constants/constants.dart';
import 'package:plant_shop/models/plant_model.dart';
import 'package:plant_shop/widgets/persian_number.dart';
import 'package:plant_shop/widgets/plant_widget.dart';

class CartScreen extends StatefulWidget {
  final List<Plant> addedToCartPlants;

  const CartScreen({
    super.key,
    required this.addedToCartPlants,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int sumShoppingCart() {
    int counter = 0;
    for (var element in widget.addedToCartPlants) {
      counter += element.price;
    }
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.addedToCartPlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset("assets/images/add-cart.png"),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "سبد خرید تارعنکبوت بسته است !",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: "byekan",
                    ),
                  )
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              // height: size.height * 0.8,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NewPlantWidget(
                            plantList: widget.addedToCartPlants, index: index);
                      },
                      itemCount: widget.addedToCartPlants.length,
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(thickness: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                child: Image.asset(
                                  "assets/images/PriceUnit-green.png",
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                sumShoppingCart().toString().persianNumber,
                                style: TextStyle(
                                  fontFamily: "lalezar",
                                  color: Constants.primaryColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "جمع کل",
                            style: TextStyle(
                              fontFamily: "lalezar",
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
