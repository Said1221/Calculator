
// Said Emad
//Task1 : Create Basic Banking System

import 'dart:ffi';

import 'package:basic_calculator/Home_Screen.dart';
import 'package:basic_calculator/adsManger.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:provider/provider.dart';



void main()
async{

  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();


  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();




  runApp(
      // Provider.value(
      // value : adManager,
      // child:
      MyApp());
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget
{

  // constructor
  // build

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }


}