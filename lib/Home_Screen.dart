

import 'package:basic_calculator/adsManger.dart';
import 'package:basic_calculator/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  double  first=0.0;
  double  second =0.0;
  String history = '';
  String texttodisplay = '';
  String res = '';
  String res2 = '';
  String operation = '';

  void btnonClick(String value){
    print(value);
    if(value == '+' || value == '-' || value == '/' || value == '*'){

      first = double.parse(texttodisplay);
      res = '';
      operation = value;

    }

    else if(value == 'AC'){
      first =0;
      second =0;
      texttodisplay = '';
      res = '';
      history = '';
    }

    else if(value == '='){
      
      second = double.parse(texttodisplay);

      if(operation == '+'){
        res = (first + second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
      if(operation == '-'){
        res = (first - second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
      if(operation == '*'){
        res = (first * second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
      if(operation == '/'){
        res = (first / second).toString();
        history = first.toString() + operation.toString() + second.toString();
      }
    }

    // else if(value=='.'){
    //   res = texttodisplay + '.';
    // }

    else{
        res = (texttodisplay + value).toString();
        // res = int.parse(texttodisplay + value).toString();
    }

    setState(() {
      texttodisplay=res;

    });


  }



  //banner//
  BannerAd bannerAd;
  bool isAdReady = false;
  final AdSize adSize = AdSize.banner;
  void createBannerAd(){
    bannerAd = BannerAd(
      size: adSize,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
          onAdLoaded: (ad){
            setState((){
              isAdReady = true;
            });
          },
          onAdFailedToLoad: (ad , error){
            print('said s3ada : ${error.message}');
          }
      ),
      request: const AdRequest(),
    );
    bannerAd.load();

  }
  @override
  void initState(){
    super.initState();
    createBannerAd();
  }
  @override
  void dispose(){
    super.dispose();
    bannerAd.dispose();
  }
  //banner//





  @override
  Widget build(BuildContext context){
    
    return SafeArea(
      child: Scaffold(
        body: Container(


          color: Colors.black,
          child: Column(
            children: [

              Container(
                width: adSize.width.toDouble(),
                height: adSize.height.toDouble(),
                child: AdWidget(ad: bannerAd,),
                alignment: Alignment.center,
              ),


              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor("000000"),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    history,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    texttodisplay,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: HexColor("000000"),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("191919"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('7');
                                    },
                                    child: Text(
                                      '7',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("191919"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('4');
                                    },
                                    child: Text(
                                      '4',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("191919"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('1');
                                    },
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("191919"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('.');
                                    },
                                    child: Text(
                                      '.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        VerticalDivider(
                          color: Colors.black,
                        ),

                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("191919"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('8');
                                    },
                                    child: Text(
                                      '8',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("191919"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('5');
                                    },
                                    child: Text(
                                      '5',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("191919"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('2');
                                    },
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("191919"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('0');
                                    },
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        VerticalDivider(
                          color: Colors.black,
                        ),

                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("191919"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('9');
                                    },
                                    child: Text(
                                      '9',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("191919"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('6');
                                    },
                                    child: Text(
                                      '6',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("191919"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('3');
                                    },
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("191919"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('00');
                                    },
                                    child: Text(
                                      '00',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        VerticalDivider(
                          color: Colors.black,
                        ),

                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("ffd966"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('/');
                                    },
                                    child: Text(
                                      '/',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("ffd966"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('*');
                                    },
                                    child: Text(
                                      'X',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("ffd966"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('-');
                                    },
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("ffd966"),
                                  ),
                                  child: TextButton(
                                    onPressed: (){
                                      btnonClick('+');
                                    },
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        VerticalDivider(
                          color: Colors.black,
                        ),

                        Expanded(
                          child: Container(
                            child: Column(

                              children: [

                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: HexColor("f44336"),
                                    ),
                                    child: TextButton(
                                      onPressed: (){
                                        btnonClick('AC');
                                      },
                                      child: Text(
                                        'AC',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,

                                          color: HexColor("cc0000"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),

                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: HexColor("8fce00"),
                                    ),
                                    child: TextButton(
                                      onPressed: (){
                                        btnonClick('=');
                                      },
                                      child: Text(
                                        '=',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,

                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),



                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
