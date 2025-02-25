class PostModel {
  String title, description, price;

  PostModel(
      {required this.title, required this.description, required this.price});

  factory PostModel.fromJson(Map m1) {
    return PostModel(
      title: m1["title"],
      description: m1["description"],
      price: m1["price"],
    );
  }
}

class PurchasedPostModel {
  late String title,
      shortDes,
      status,
      purchasedDate,
      image,
      publishedDate,
      fullDes,
      revenueGrowth;

  PurchasedPostModel(
      {required this.title,
      required this.shortDes,
      required this.status,
      required this.purchasedDate,
      required this.image,
      required this.publishedDate,
      required this.fullDes,
      required this.revenueGrowth});

  factory PurchasedPostModel.fromJson(Map m1) {
    return PurchasedPostModel(
      title: m1["title"],
      shortDes: m1["shortDes"],
      status: m1["status"],
      purchasedDate: m1["purchaseDate"],
      image: m1["image"],
      publishedDate: m1["publishedDate"],
      fullDes: m1["fullDes"],
      revenueGrowth: m1["revenueGrowth"],
    );
  }
}
