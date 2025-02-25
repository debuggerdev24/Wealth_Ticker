import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/widgets/my_app_layout.dart';
import '../../../core/widgets/my_button.dart';
import '../../../core/widgets/my_textfield.dart';

TextEditingController _textEmail = TextEditingController();

class SendUsEmailScreen extends StatelessWidget {
  const SendUsEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(title: "Send us an Email", body: Padding(
      padding: EdgeInsets.fromLTRB(12.w, 24.h, 12.w, 5.h),
      child: Column(
        children: [
          MyTextField(
            title: "Ethan carter (user)",
            hintText: "ethancarter@gmail.com",
            controller: _textEmail,
            prefix: Icon(
              CupertinoIcons.mail,
            ),
          ),
          SizedBox(height: 16.h),
          MyTextField(
            readOnly: true,
            maxLine: 2,
            title: "Query",
            hintText: "Why did AAPL drop after the Fed announcement? Will it rebound from 170 support?",
            controller: _textEmail,
            prefix: Icon(
              CupertinoIcons.question_circle,
            ),
          ),
          Spacer(),
          MySubmitButtonFilled(title: "Send Email", onPressed: () {
            sendEmail("ankitumredkardds@gmail.com");
          }),
          SizedBox(height: 25.h)
        ],
      ),
    ),);
  }

  void sendEmail(String recipient) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: recipient,
    );
    launchUrl(emailLaunchUri);
  }
}
