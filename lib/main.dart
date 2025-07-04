import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:wardrobe/hive/hive_methods.dart';
import 'package:wardrobe/screens/home.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('WARDROBE');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WardrobeData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wardrobe',
        home: Home(),
      ),
    );
  }
}
