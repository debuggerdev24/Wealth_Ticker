class PastWinnersModel {
  late String name, date, image, price;

  PastWinnersModel(
      {required this.name,
      required this.date,
      required this.image,
      required this.price});

  factory PastWinnersModel.fromJson(Map m1) {
    return PastWinnersModel(
      name: m1["name"],
      date: m1["date"],
      image: m1["image"],
      price: m1["price"],
    );
  }
}
