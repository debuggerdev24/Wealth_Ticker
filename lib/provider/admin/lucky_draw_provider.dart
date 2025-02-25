import 'package:flutter/cupertino.dart';
import 'package:wealth_ticker_main/model/admin/participant_user_model.dart';
import 'package:wealth_ticker_main/model/user/earning_model.dart';

class LuckyDrawProvider extends ChangeNotifier {
  List<ParticipantUserModel> participantUsersList = [
    ParticipantUserModel(
      title: "Stock Talk",
      customerName: "Chloe Young",
      numOfPurchasedPost: 04,
      image:
          "https://s3-alpha-sig.figma.com/img/312b/e8dc/8883945272046356095fc20da211d690?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=OAQPsjBnLQLR-p6uAFx7cfXSF90KngCmxLTnKOFoa3CeZEchX8ODAC68639sMPqMY~Iqmet3dqS6JxryMSwR0oCucUPjFN94oQNPqBFzTl9o7aCA7SwIzw4iagrpwrA7Rmjf~0sp-TUZL86ueShiq~9lIygeCi9ThgF39-0Zzko65gW~r8DfX1yiKjLB20Ud6lOCiJU1xFnXk7XiDRcrH4dxLrz4a5H4iIbpg6ML6hQe6ue83EnvjkYgt~3xYOtDdOBJflp6FgtNl9QKvAQ3uXp9kQI4ACuiU45ZmL1lwisv-x6PZguF2IqJtg7xf5SxLWH3mp8Frm3ew3Lger-ftg__",
    )
  ];

  List<PastWinnersModel> pastWinners = [
    PastWinnersModel(
      name: "Isla Clark",
      date: "February 16",
      image: "https://s3-alpha-sig.figma.com/img/c21c/6896/8665826d72baf80960d2bc4f8f56741e?Expires=1740960000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YLyDK6mXohxlYIYwdjDdSz3i2-tbp8uerjg1cbFO2nt2dqfCizKju9zpYCMdvBF26AqkSCXoGyZzRiVRIWcqOMKm6tGaJ93gKPxYAzr1gTbIqkg1VWZIyu1muQXbmWOtdJKQ7k0-vYKucKKKwLQjPSDeZAzX4Qbgz0IfeePByRmt25j-OYSQvRulR3L6WCTy2spC5lEEGKAa3-CW2WYvLY2rVf3hlYWGTbEYs2kVH0n72tHbbZOV~t2xM2XVE0qQBg8NuzCUtSLnPDhnH~-KP2xqEXewizI4w0U9UDRX2Cj1SVSiWtKI7XJcEKv7NiImsvodTVjAr~0F81Vhn1DhUg__",
      price: "\$1,200",
    ),
    PastWinnersModel(
      name: "Isla Clark",
      date: "February 16",
      image: "https://s3-alpha-sig.figma.com/img/c21c/6896/8665826d72baf80960d2bc4f8f56741e?Expires=1740960000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YLyDK6mXohxlYIYwdjDdSz3i2-tbp8uerjg1cbFO2nt2dqfCizKju9zpYCMdvBF26AqkSCXoGyZzRiVRIWcqOMKm6tGaJ93gKPxYAzr1gTbIqkg1VWZIyu1muQXbmWOtdJKQ7k0-vYKucKKKwLQjPSDeZAzX4Qbgz0IfeePByRmt25j-OYSQvRulR3L6WCTy2spC5lEEGKAa3-CW2WYvLY2rVf3hlYWGTbEYs2kVH0n72tHbbZOV~t2xM2XVE0qQBg8NuzCUtSLnPDhnH~-KP2xqEXewizI4w0U9UDRX2Cj1SVSiWtKI7XJcEKv7NiImsvodTVjAr~0F81Vhn1DhUg__",
      price: "\$1,200",
    ),
  ];
}
