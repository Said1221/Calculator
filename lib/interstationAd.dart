import 'package:basic_calculator/helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdInterstation{
  static InterstitialAd interstitialAd;
  static bool isAdReady = false;

  static void loadInterstitialAd(){
    InterstitialAd.load(
        adUnitId: AdHelper.bottonSheet,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad){
              isAdReady = true;
              interstitialAd = ad;

            },
            onAdFailedToLoad: (error){
              print("said s3ada");
            }
        ),
    );
  }

  static void showInterstitialAd(){
    if(isAdReady){
      interstitialAd.show();
    }
   }
}