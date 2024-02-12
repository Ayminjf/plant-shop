import 'package:flutter/material.dart';
import 'package:plant_shop/models/plant_model.dart';

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
    return const Scaffold(
      body: Center(
        child: Text("علاقه مندی ها"),
      ),
    );
  }
}
