import 'package:flutter/material.dart';

import '../model/chat_model.dart';

class ChatProvider extends ChangeNotifier {
  List<ChatModel> chatList = [
    ChatModel(
      message:
          "Market Update:\nTesla (\$TSLA) is testing resistance at \$200. A breakout could signal an uptrend.",
      time: "2.06 PM",
      sender: "Jone Due",
      receiver: "Ethan Carter",
    ),
    ChatModel(
        message: '"Will TSLA break \$200 resistance?"',
        time: "2.10 PM",
        sender: "Ethan Carter",
        receiver: "Jone Due"),
    ChatModel(
        message: "Can you help with my billing?",
        time: "2.10 PM",
        sender: "Ethan Carter",
        receiver: "Jone Due"),
    ChatModel(
      message: "Sure, let me check your details.",
      time: "2.12 PM",
      sender: "Jone Due",
      receiver: "Ethan Carter",
    ),
    ChatModel(
      message: "Sure",
      time: "2.12 PM",
      sender: "Jone Due",
      receiver: "Ethan Carter",
    ),
  ];
}
