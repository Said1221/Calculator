import 'dart:developer';

import 'package:basic_calculator/helper.dart';
import 'package:basic_calculator/interstationAd.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBanner extends StatefulWidget {


  @override
  State<AdBanner> createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {



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
            log('said s3ada : ${error.message}');
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
  Widget build(BuildContext context) {
   // if(isAdReady){
    
      return SafeArea(
        child: Scaffold(
          body: Container(

            //banner//
            width: adSize.width.toDouble(),
            height: adSize.height.toDouble(),
            child: AdWidget(ad: bannerAd,),
            alignment: Alignment.center,
           // banner//


            // child: Column(
            //   children: [
            //     IconButton(onPressed: ()
            //     {
            //       AdInterstation.loadInterstitialAd();
            //       log('success');
            //     },
            //         icon: Icon(
            //           Icons.ac_unit,
            //         ),
            //     ),
            //     IconButton(onPressed: ()
            //     {
            //       AdInterstation.showInterstitialAd();
            //       log('success');
            //     },
            //       icon: Icon(
            //         Icons.slideshow,
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      );
   // }
    return Container(

    );
  }
}
