import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/preferences/provider/counter_provider.dart';
import 'package:flutter_application_1/controller/preferences/provider/fav_provider.dart';
import 'package:flutter_application_1/view/fav_screen.dart';
import 'package:flutter_application_1/view/home_saver_screen.dart';
import 'package:flutter_application_1/view/home_screen.dart';
import 'package:flutter_application_1/view/slider_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> CounterProvider()),
        ChangeNotifierProvider(create: (context)=> FavouriteProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: MyHome(),
        // home: sliderScreen(),
        // home: HomeSaverScreen(),
        home: FavouriteScreen(),
      ),
    );
  }
}