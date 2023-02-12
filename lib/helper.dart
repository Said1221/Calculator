import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper{
  static const bool testMode = false;

  //banner//
  static String get bannerAdUnitId{
    if(testMode){
      return BannerAd.testAdUnitId;
    }
    return 'ca-app-pub-6262340920654581/3557845674';
  }
  //banner//


  //interstitial//
  static String get bottonSheet{
    if(testMode){
      return InterstitialAd.testAdUnitId;
    }
    return 'ca-app-pub-6262340920654581/2771377612';
  }
  //interstitial//

}

