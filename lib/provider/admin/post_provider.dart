import 'package:flutter/cupertino.dart';
import 'package:wealth_ticker_main/model/admin/post_model.dart';

class PostProvider extends ChangeNotifier {
  List<PostModel> postList = [
    PostModel(
      postTitle: "\$TSLA",
      shortDes: "Tech Stocks on the Rise",
      status: "Paid",
      postedOn: "Feb 15, 2025",
      luckyDrawStatus: "Active",
      purchaseOn: "\$6.05",
    ),
    PostModel(
      postTitle: "\$TSLA",
      shortDes: "Tech Stocks on the Rise",
      status: "Paid",
      postedOn: "Feb 15, 2025",
      luckyDrawStatus: "Active",
      purchaseOn: "\$7.15",
    ),
  ];
}
