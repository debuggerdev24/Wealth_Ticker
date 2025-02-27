import 'package:flutter/cupertino.dart';
import '../../model/admin/pay_out_list_model.dart';

class PayOutProvider extends ChangeNotifier {
  List<PayOutUsersModel> payoutList = [
    PayOutUsersModel(
      amount: 1500,
      status: false,
      paymentMethods: "Wise App",
      requestDate: "Feb 20, 2025",
      image: "https://s3-alpha-sig.figma.com/img/1690/dcb9/87dc1bcc841b99cd8673f9851b377b59?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=mGyrnuo7s3bKGcGTAFFdj7E2dAoNxe7zDF0b5gsrrhoqS-EsLDnamMpzOOjFLXdquvBwkfMt63ejLSN2EMZaj0DXQQ~2KBYC2YT8r-SFPZHCGV2fUlj4cEPWMlVQYZisGMKJXQAFDA1SyPxTkVxuodBDhU6nMd724fojN63qPv-Gnf0IOoKCud0iBzksGTy7R99MnA~szPHAgDfeCqIRmOScoemkimclc1EtWa~oZ-iPT21kuu5HM~42ojTR3kFci5nyDrO7FXvGa~uGNUxDmFoTxupsMZIgRcmo97I29TtTSLbWuETl4ft7yc4zSyxMs4ATVDL7mz9P35mwT10gQQ__",
      customerName: "AlexT",
    ),
    PayOutUsersModel(
      amount: 1000,
      status: true,
      paymentMethods: "Wise App",
      requestDate: "Feb 20, 2025",
      image: "https://s3-alpha-sig.figma.com/img/ce05/9687/417066e0318517826882d91d7ca5e760?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=A5OFgUt6eKhajqefNwU~A6I07ztDHqTjzLJEGM6RNPTyrvF1SBMXRGjM81LaDfeOp6vacg1Sz6XvwFxTP9509meYd0zp9R5MdywwjvzEk2OWKfpiX0jlYFZWzcpZeIdOAwga96vy850a3dhSiRQzqY9gb8A4lroZzPx3A4d2~6f8L1eXSAeMBOiVX5VW6i4wwYtM0FzVeIWqjNIaPwA5d7rqiQIBWi4H1MC~WZXp3vjU2APesW~jGJzSrc8dMj24T6y3SUXanF3pzCp~EH9-cfvkzwP2AwcgRhpBNFl5hFBtRQL8QE2FNOmqEgybRA0YMFd59Mg6vzRdSG0uNpNoOg__",
      customerName: "SarahP",
    ),
  ];
}
