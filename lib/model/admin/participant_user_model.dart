class ParticipantUserModel {
  late String title, customerName, image;
  late int numOfPurchasedPost;

  ParticipantUserModel({
    required this.title,
    required this.customerName,
    required this.numOfPurchasedPost,
    required this.image,
  });

  factory ParticipantUserModel.fromJson(Map m1) {
    return ParticipantUserModel(
      title: m1["title"],
      customerName: m1["customerName"],
      numOfPurchasedPost: m1["numOfPurchasedPost"],
      image: m1["image"],
    );
  }
}
