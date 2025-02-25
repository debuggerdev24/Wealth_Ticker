import 'package:flutter/cupertino.dart';
import 'package:wealth_ticker_main/model/post_model.dart';

class PurchasedPostProvider extends ChangeNotifier {
  List<PurchasedPostModel> purchasedPostList = [
    PurchasedPostModel(
      title: "Market Update",
      shortDes:
          "The S&P 500 closed 1.2% higher today, driven by gains in the tech and energy sectors...",
      status: "Paid – “Unlocked",
      purchasedDate: "February 18, 2025",
      image:
          'https://m.economictimes.com/thumb/msid-105378105,width-1600,height-900,resizemode-4,imgsize-1231415/stock-market.jpg',
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
          'https://m.economictimes.com/thumb/msid-105378105,width-1600,height-900,resizemode-4,imgsize-1231415/stock-market.jpg',
      publishedDate: 'February 17, 2025',
      fullDes:
          "“Tesla reported better-than-expected Q4 earnings, driven by strong sales of its Model Y vehicles. Revenue totaled \$24.3 billion, surpassing estimates of \$22.5 billion. Additionally, Tesla's entry into new markets like Southeast Asia positions the company for sustained growth. Challenges include supply chain constraints and increasing competition from legacy automakers.”",
      revenueGrowth: "+12% YoY.",
    ),
  ];
}
