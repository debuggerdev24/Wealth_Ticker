import 'package:flutter/cupertino.dart';
import 'package:wealth_ticker_main/model/user/post_model.dart';

class HomeProvider extends ChangeNotifier {
  List<PostModel> postList = [
    PostModel(
      title: "1. Market Update",
      description: "The S&P 500 closed 1.2% higher today, driven by gains in the tech and energy sectors. Watch for tomorrow's inflation data release, which could impact market sentiment.",
      price: 5.99,
      isPurchased: true
    ),
    PostModel(
      title: "2. Sector Insight",
      description: "Energy stocks rallied today as crude oil prices hit \$85 per barrel. Look out for \$XOM and \$CVX as key players in this trend.",
      price: 6.99,
      isPurchased: false
    ),
    PostModel(
      title: "3. Warning/Alert",
      description: "Be cautious with \$TSLA. It's approaching critical resistance at \$200, and profit-taking could trigger a pullback.",
      price: 3.99,
      isPurchased: false
    )
  ];
}
