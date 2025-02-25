import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/main.dart';

class ManageParticipantScreen extends StatelessWidget {
  const ManageParticipantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Manage Participantsq",
      body: Padding(
        padding: appPadding(),
        child: Column(
          children: [
            16.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
