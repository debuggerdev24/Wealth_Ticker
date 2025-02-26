class PostModel {
  String postTitle, shortDes, status, postedOn, luckyDrawStatus, purchaseOn;

  PostModel(
      {required this.postTitle,
      required this.shortDes,
      required this.status,
      required this.postedOn,
      required this.luckyDrawStatus,
      required this.purchaseOn});

  factory PostModel.fromJson(Map m1) {
    return PostModel(
      postTitle: m1["postTitle"],
      shortDes: m1["shortDes"],
      status: m1["status"],
      postedOn: m1["postedOn"],
      luckyDrawStatus: m1["luckyDrawStatus"],
      purchaseOn: m1["purchaseOn"],
    );
  }
}
