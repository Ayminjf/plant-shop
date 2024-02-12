import 'package:flutter/material.dart';
import 'package:plant_shop/models/plant_model.dart';
import 'package:plant_shop/widgets/plant_widget.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Plant> favoritedPlants;
  const FavoriteScreen({
    super.key,
    required this.favoritedPlants,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritedPlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset("assets/images/favorited.png"),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "ظاهرا به هیچی علاقه نداشتی :)",
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
                      plantList: widget.favoritedPlants, index: index);
                },
                itemCount: widget.favoritedPlants.length,
              ),
            ),
    );
  }
}
