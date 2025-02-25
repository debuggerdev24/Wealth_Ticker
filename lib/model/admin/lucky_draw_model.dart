class PastWinnersAdminModel {
  late String name, date, image, price;

  PastWinnersAdminModel(
      {required this.name,
        required this.date,
        required this.image,
        required this.price});

  factory PastWinnersAdminModel.fromJson(Map m1) {
    return PastWinnersAdminModel(
      name: m1["name"],
      date: m1["date"],
      image: m1["image"],
      price: m1["price"],
    );
  }
}
