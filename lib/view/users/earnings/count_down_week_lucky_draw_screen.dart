import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import 'package:wealth_ticker_main/provider/user/earning_provider.dart';
import 'package:wealth_ticker_main/view/admin/admin_dashboard_screen.dart';
import 'package:wealth_ticker_main/view/users/user_dashboard_screen.dart';

import '../../../core/app_assets.dart';

class WeekLuckyDrawScreen extends StatelessWidget {
  const WeekLuckyDrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EarningsProvider providerTrue =
        Provider.of<EarningsProvider>(context, listen: true);
    EarningsProvider provider =
        Provider.of<EarningsProvider>(context, listen: false);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        indexTabUser.value = 0;
        return;
      },
      child: MyAppLayOut(
        showBackButton: false,
        leading: TextButton(
          onPressed: () {
            context.pushNamed(AppRoutes.luckyDrawWinnerScreen.name);
          },
          child: Text(
            "See Winner",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 10.w,
            ),
            child: GestureDetector(
                onTap: () {
                  context.push(AppRoutes.bankDetailsScreen.path);
                },
                child: SVGImages(path: AppAssets.bankEdit)),
          ),
        ],
        title: "Week's Lucky Draw",
        body: Padding(
          padding: appPadding(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                23.h.verticalSpace,
                //todo -------------> element to replace
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      16.h.verticalSpace,
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomPaint(
                              size: Size(315.w, 160.h),
                              painter: HalfCirclePainter(59),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 60.h,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Countdown",
                                    style: textStyleW700.copyWith(
                                      color: Colors.grey,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  6.h.verticalSpace,
                                  Text(
                                    "02 : 45 : 30",
                                    style: textStyleW700.copyWith(
                                      fontSize: 40.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      34.h.verticalSpace,
                      Divider(height: 0),
                      _title("Draw Amount Details :"),
                      _detailsWidget(title: "Draw Amount", data: "\$1,500"),
                      _detailsWidget(
                          title: "Entries So Far", data: "125 Participants"),
                    ],
                  ),
                ),
                //todo ------------->
                14.h.verticalSpace,
                Divider(height: 0),
                _title("How the Draw Works :"),
                Text(
                    '"Each paid post unlocks one entry to this week’s lucky draw. Winners will be announced after the draw ends, and the post becomes free."'),
                20.h.verticalSpace,
                Divider(height: 0),
                _title("Disclaimer :"),
                Text(
                    '"Ensure your bank details are updated to receive the prize amount. Only one entry per customer is allowed."'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _title(String title) {
  return Padding(
    padding: EdgeInsets.only(top: 20.h, bottom: 16.h),
    child: Text(
      title,
      style: textStyleW600.copyWith(
        fontSize: 16.sp,
      ),
    ),
  );
}

Widget _detailsWidget({required String title, required String data}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 12.h),
    child: Row(
      children: [
        Text(title),
        Text("  :  "),
        Expanded(
          child: Text(data),
        ),
      ],
    ),
  );
}

// class HalfCirclePainter extends CustomPainter {
//   final double progress;
//
//   HalfCirclePainter(this.progress);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint backgroundPaint = Paint()
//       ..color = Colors.grey.shade300
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 22
//       ..strokeCap = StrokeCap.round;
//
//     final Paint progressPaint = Paint()
//       ..color = Colors.teal.shade900
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 22
//       ..strokeCap = StrokeCap.round;
//
//     final double startAngle = pi;
//     final double sweepAngle = pi * (progress / 100);
//
//     canvas.drawArc(
//       Rect.fromLTWH(0, 0, size.width, size.height * 2),
//       startAngle,
//       pi,
//       false,
//       backgroundPaint,
//     );
//
//     // Draw progress arc
//     canvas.drawArc(
//       Rect.fromLTWH(0, 0, size.width, size.height * 2),
//       startAngle,
//       sweepAngle,
//       false,
//       progressPaint,
//     );
//
//     // Draw percentage label inside the arc
//     final textPainter = TextPainter(
//       text: TextSpan(
//         text: "${progress.toInt()}%",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//     textPainter.layout();
//     final textOffset = Offset(
//       size.width / 2 - textPainter.width / 2,
//       -10, // Position inside the arc
//     );
//     textPainter.paint(canvas, textOffset);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

class HalfCirclePainter extends CustomPainter {
  final double progress;

  HalfCirclePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 19
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = Colors.teal.shade900
      ..style = PaintingStyle.stroke
      ..strokeWidth = 19
      ..strokeCap = StrokeCap.round;

    final Paint circlePaint = Paint()
      ..color = Colors.teal.shade900
      ..style = PaintingStyle.fill; // Solid fill for the circle indicator

    final double startAngle = pi; // Start from the left (180°)
    final double sweepAngle = pi * (progress / 100); // Progress arc

    final Rect arcRect = Rect.fromLTWH(0, 0, size.width, size.height * 2);

    // Draw background arc
    canvas.drawArc(
      arcRect,
      startAngle,
      pi,
      false,
      backgroundPaint,
    );

    // Draw progress arc
    canvas.drawArc(
      arcRect,
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );

    // Calculate the endpoint for the indicator circle
    double radius = size.width / 2;
    double angle = startAngle + sweepAngle;

    double circleX = radius + radius * cos(angle);
    double circleY = radius + radius * sin(angle);

    // Draw the indicator circle
    canvas.drawCircle(Offset(circleX, circleY), 22, circlePaint);
    final textPainter = TextPainter(
      text: TextSpan(
        text: "${progress.toInt()}%",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final textOffset = Offset(
      circleX - textPainter.width / 2,
      circleY - textPainter.height / 2,
    );
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
