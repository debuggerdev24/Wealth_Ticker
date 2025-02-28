import 'package:flutter/cupertino.dart';
import 'package:wealth_ticker_main/model/user/post_model.dart';

class PurchasedPostProvider extends ChangeNotifier {
  List<PurchasedPostModel> purchasedPostList = [
    PurchasedPostModel(
      title: "Market Update",
      shortDes:
          "The S&P 500 closed 1.2% higher today, driven by gains in the tech and energy sectors...",
      status: "Paid – “Unlocked",
      purchasedDate: "February 18, 2025",
      image:
          'https://s3-alpha-sig.figma.com/img/0b8b/f2aa/0382c437219c255e78262005bac85f05?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=mYvnwDtoVPXPUjValSd0T-8uV2Af3C5N9IClLEXOH7gM7dkTK4VuO7SM3xDYtKW83d5EppiNfP3yNPdNZaYLXHfguUzfnkL9qluukRgffTjXEyHc2Sqhd13-GAgGoTs~w10NBL54Oi7BGTJc0-8LpG0yplQzNDH9pHVBMf3empQw5eN4nlHsL~CnbhYcq4Myz6qXxYtrcMQZ0hwjL-fKkEaw1lnX9i9bNrVsStFM3WuWUOxVyBO0fp1~cLhsN3fRoQWP69JZlxBs95T7WCGDz--nYZCmvJVLKaGDh53aBMnJqvEqzLqtBJcfPj7f~ZQnKmc8v0cx~-e8lc2pz1oEVQ__',
      publishedDate: 'February 17, 2025',
      fullDes:
          "“Tesla reported better-than-expected Q4 earnings, driven by strong sales of its Model Y vehicles. Revenue totaled \$24.3 billion, surpassing estimates of \$22.5 billion. Additionally, Tesla's entry into new markets like Southeast Asia positions the company for sustained growth. Challenges include supply chain constraints and increasing competition from legacy automakers.”",
      revenueGrowth: "+12% YoY.",
    ),
    PurchasedPostModel(
      title: "Tech Stocks",
      shortDes:
          "Tech stocks are shares of companies in the technology sector, known for innovation...",
      status: "Free – “Unlocked(Draw Ends)",
      purchasedDate: "February 11, 2025",
      image:
          'https://s3-alpha-sig.figma.com/img/0b8b/f2aa/0382c437219c255e78262005bac85f05?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=mYvnwDtoVPXPUjValSd0T-8uV2Af3C5N9IClLEXOH7gM7dkTK4VuO7SM3xDYtKW83d5EppiNfP3yNPdNZaYLXHfguUzfnkL9qluukRgffTjXEyHc2Sqhd13-GAgGoTs~w10NBL54Oi7BGTJc0-8LpG0yplQzNDH9pHVBMf3empQw5eN4nlHsL~CnbhYcq4Myz6qXxYtrcMQZ0hwjL-fKkEaw1lnX9i9bNrVsStFM3WuWUOxVyBO0fp1~cLhsN3fRoQWP69JZlxBs95T7WCGDz--nYZCmvJVLKaGDh53aBMnJqvEqzLqtBJcfPj7f~ZQnKmc8v0cx~-e8lc2pz1oEVQ__',
      publishedDate: 'February 17, 2025',
      fullDes:
          "“Tesla reported better-than-expected Q4 earnings, driven by strong sales of its Model Y vehicles. Revenue totaled \$24.3 billion, surpassing estimates of \$22.5 billion. Additionally, Tesla's entry into new markets like Southeast Asia positions the company for sustained growth. Challenges include supply chain constraints and increasing competition from legacy automakers.”",
      revenueGrowth: "+12% YoY.",
    ),
  ];
}
