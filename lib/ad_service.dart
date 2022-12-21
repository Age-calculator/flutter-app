import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  static String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-1838713106109418/7699753123'
      : 'ca-app-pub-1838713106109418/7699753123';

  static initialize() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd mybanner() {
    BannerAd ad = new BannerAd(
      size: AdSize.largeBanner,
      adUnitId: bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => print('Ad Loaded'),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('Ad opened'),
        onAdClosed: (Ad ad) => print('Ad closed'),
      ),
      request: AdRequest(),
    );
    return ad;
  }
}
