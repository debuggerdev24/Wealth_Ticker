import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  Map switches = {
    "Market Alerts": false,
    "News & Updates": true,
    "Reminders": true,
  };

  bool isGroupNotificationOn = false;

  void toggleSwitch(String key) {
    switches[key] = !switches[key]!;
    notifyListeners();
  }

  void toggleSwitchNotification() {
    isGroupNotificationOn = !isGroupNotificationOn;
    notifyListeners();
  }
}