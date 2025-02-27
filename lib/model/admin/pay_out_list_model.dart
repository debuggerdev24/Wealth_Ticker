class PayOutUsersModel {
  late int amount;
  late bool status;
  late String paymentMethods, requestDate, image, customerName;

  PayOutUsersModel(
      {required this.amount,
      required this.status,
      required this.paymentMethods,
      required this.requestDate,
      required this.image,
      required this.customerName});

  factory PayOutUsersModel.fromJson(Map m1) {
    return PayOutUsersModel(
      amount: m1["amount"],
      status: m1["status"],
      paymentMethods: m1["paymentMethods"],
      requestDate: m1["requestDate"],
      image: m1["image"],
      customerName: m1["customerName"],
    );
  }
}
