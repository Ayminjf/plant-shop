import 'package:flutter/material.dart';
import 'package:plant_shop/models/plant_model.dart';

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
    return const Scaffold(
      body: Center(
        child: Text("سبدخرید"),
      ),
    );
  }
}
