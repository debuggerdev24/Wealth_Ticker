class ChatModel {
  String message, time, sender, receiver;

  ChatModel(
      {required this.message,
      required this.time,
      required this.sender,
      required this.receiver});

  factory ChatModel.fromJson(Map m1) {
    return ChatModel(
        message: m1["message"],
        time: m1["time"],
        sender: m1["sender"],
        receiver: m1["receiver"]);
  }
}
