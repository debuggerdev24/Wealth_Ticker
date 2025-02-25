import 'package:flutter/cupertino.dart';

import '../model/subscription_plan_model.dart';

class SubscriptionPlanProvider extends ChangeNotifier {
  bool isSavePaymentMethod = false;

  void changeStatus() {
    isSavePaymentMethod = !isSavePaymentMethod;
    notifyListeners();
  }

  List<SubscriptionPlanModel> subscriptionPlans = [
    SubscriptionPlanModel(
      planName: "Basic Plan",
      price: "\$9.99",
      duration: "month",
      features: ["Limited access", "1 chat", "No premium inside"],
    ),
    SubscriptionPlanModel(
      planName: "Standard Plan",
      price: "\$19.99",
      duration: "month",
      features: ["Full access", "3 chats", "Priority support"],
    ),
    SubscriptionPlanModel(
      planName: "Premium Plan",
      price: "\$29.99",
      duration: "month",
      features: ["Full access", "5 chats", "Premium insights", "24/7 Support"],
    ),
  ];

  List<SubscriptionPlanModel> getSubscriptionPlans() {
    return subscriptionPlans;
  }
}
