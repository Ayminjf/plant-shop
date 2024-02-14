import 'package:flutter/material.dart';
import 'package:plant_shop/models/plant_model.dart';
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              height: size.height * 0.8,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return NewPlantWidget(
                      plantList: widget.addedToCartPlants, index: index);
                },
                itemCount: widget.addedToCartPlants.length,
              ),
            ),
    );
  }
}
