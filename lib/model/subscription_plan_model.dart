class SubscriptionPlanModel {
  late String planName, price, duration;
  late List features;

  SubscriptionPlanModel(
      {required this.planName,
      required this.price,
      required this.duration,
      required this.features});

  factory SubscriptionPlanModel.fromJson(Map m1) {
    return SubscriptionPlanModel(
      planName: m1["planName"],
      price: m1["price"],
      duration: m1["duration"],
      features: m1["features"],
    );
  }
}
