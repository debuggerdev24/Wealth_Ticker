import 'package:flutter/cupertino.dart';

import '../../model/earning_model.dart';

class EarningsProvider extends ChangeNotifier {
  bool isComplete = true;

  List<PastWinnersModel> pastWinners = [
    PastWinnersModel(
        name: "Isla Clark",
        date: "February 16",
        image: "https://s3-alpha-sig.figma.com/img/c21c/6896/8665826d72baf80960d2bc4f8f56741e?Expires=1740960000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YLyDK6mXohxlYIYwdjDdSz3i2-tbp8uerjg1cbFO2nt2dqfCizKju9zpYCMdvBF26AqkSCXoGyZzRiVRIWcqOMKm6tGaJ93gKPxYAzr1gTbIqkg1VWZIyu1muQXbmWOtdJKQ7k0-vYKucKKKwLQjPSDeZAzX4Qbgz0IfeePByRmt25j-OYSQvRulR3L6WCTy2spC5lEEGKAa3-CW2WYvLY2rVf3hlYWGTbEYs2kVH0n72tHbbZOV~t2xM2XVE0qQBg8NuzCUtSLnPDhnH~-KP2xqEXewizI4w0U9UDRX2Cj1SVSiWtKI7XJcEKv7NiImsvodTVjAr~0F81Vhn1DhUg__",
        price: "\$1,200"),
    PastWinnersModel(
        name: "Isla Clark",
        date: "February 16",
        image: "https://s3-alpha-sig.figma.com/img/c21c/6896/8665826d72baf80960d2bc4f8f56741e?Expires=1740960000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YLyDK6mXohxlYIYwdjDdSz3i2-tbp8uerjg1cbFO2nt2dqfCizKju9zpYCMdvBF26AqkSCXoGyZzRiVRIWcqOMKm6tGaJ93gKPxYAzr1gTbIqkg1VWZIyu1muQXbmWOtdJKQ7k0-vYKucKKKwLQjPSDeZAzX4Qbgz0IfeePByRmt25j-OYSQvRulR3L6WCTy2spC5lEEGKAa3-CW2WYvLY2rVf3hlYWGTbEYs2kVH0n72tHbbZOV~t2xM2XVE0qQBg8NuzCUtSLnPDhnH~-KP2xqEXewizI4w0U9UDRX2Cj1SVSiWtKI7XJcEKv7NiImsvodTVjAr~0F81Vhn1DhUg__",
        price: "\$1,200"),
  ];
}
