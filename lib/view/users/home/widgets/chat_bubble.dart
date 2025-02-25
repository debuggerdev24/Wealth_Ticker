import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/global.dart';

class ChatBubble extends StatelessWidget {
  final String message, time, userName;

  const ChatBubble(
      {super.key,
      required this.message,
      required this.time,
      required this.userName});

  @override
  Widget build(BuildContext context) {
    bool isSender = userName ==
        "Ethan Carter"; // todo condition like sender == current logged user
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: (isSender) ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: Color(0xffD5E0DD),
                borderRadius: isSender
                    ? BorderRadius.only(
                        topRight: Radius.circular(12.r),
                        topLeft: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r),
                      )
                    : BorderRadius.only(
                        topRight: Radius.circular(12.r),
                        topLeft: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      ),
                border: Border.all(color: greenColor, width: 1),
              ),
              child: Text(message),
            ),
          ),
          7.h.verticalSpace,
          Align(
            alignment: (isSender) ? Alignment.centerRight : Alignment.centerLeft,
            child: Wrap(
              // mainAxisSize: MainAxisSize.min,
              children: [
                10.w.horizontalSpace,
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://static.vecteezy.com/system/resources/thumbnails/000/439/863/small_2x/Basic_Ui__28186_29.jpg"),
                ),
                10.w.horizontalSpace,
                Text(userName,
                    style: TextStyle(fontSize: 14.sp, color: Color(0xff323232))),
                10.w.horizontalSpace,
                Text(time),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             alignment: (isSender) ? Alignment.centerRight : Alignment.centerLeft,
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
//               decoration: BoxDecoration(
//                 color: Color(0xffD5E0DD),
//                 borderRadius: isSender
//                     ? BorderRadius.only(
//                         topRight: Radius.circular(12.r),
//                         topLeft: Radius.circular(12.r),
//                         bottomLeft: Radius.circular(12.r),
//                       )
//                     : BorderRadius.only(
//                         topRight: Radius.circular(12.r),
//                         topLeft: Radius.circular(12.r),
//                         bottomRight: Radius.circular(12.r),
//                       ),
//                 border: Border.all(color: greenColor, width: 1),
//               ),
//               child: Text(message),
//             ),
//           ),
//           7.h.verticalSpace,
//           Align(
//             alignment: (isSender) ? Alignment.centerRight : Alignment.centerLeft,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 10.w.horizontalSpace,
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(
//                       "https://static.vecteezy.com/system/resources/thumbnails/000/439/863/small_2x/Basic_Ui__28186_29.jpg"),
//                 ),
//                 10.w.horizontalSpace,
//                 Text(userName,
//                     style: TextStyle(fontSize: 14.sp, color: Color(0xff323232))),
//                 10.w.horizontalSpace,
//                 Text(time),
//               ],
//             ),
//           ),
//         ],
//       ),