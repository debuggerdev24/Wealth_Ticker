import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/provider/chat_provider.dart';
import 'package:wealth_ticker_main/view/users/home/widgets/chat_bubble.dart';

class OneToOneChatScreen extends StatelessWidget {
  const OneToOneChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ChatProvider provider = Provider.of<ChatProvider>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              //todo --> top user details
              appBarView(context),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(12.w, 18.h, 12.w, 5.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "Today",
                            style: textStyleW700.copyWith(
                              color: greenColor,
                            ),
                          ),
                        ),
                        20.h.verticalSpace,
                        ...List.generate(
                          provider.chatList.length,
                          (index) {
                            final chat = provider.chatList[index];
                            return ChatBubble(
                                message: chat.message,
                                time: chat.time,
                                userName: chat.sender);
                          },
                        ),
                        // ChatBubble(
                        //   message: "Market Update: Tesla (\$TSLA) is testing resistance at \$200. A breakout could signal an uptrend.",
                        //   time: "02.06",
                        //   userName: "Jone Due",
                        // ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(),
          )
        ],
      ),
    );
  }
}

Widget appBarView(BuildContext context) {
  return Container(
    alignment: Alignment.bottomCenter,
    height: 100.h,
    decoration: BoxDecoration(color: greenColor),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          // 15.w.horizontalSpace,
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          5.w.horizontalSpace,
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
                "https://static.vecteezy.com/system/resources/thumbnails/000/439/863/small_2x/Basic_Ui__28186_29.jpg"),
          ),
          10.w.horizontalSpace,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ethan Carter",
                style:
                    textStyleW700.copyWith(color: Colors.white),
                // style: textStyle16Regular.copyWith(color: AppColors.whiteColor),
              ),
              Text(
                "Online",
                style: TextStyle(color: Colors.white),

                // style: textStyle12Regular.copyWith(color: AppColors.whiteColor),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
