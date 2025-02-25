import 'dart:developer';

extension LogExtension on Object{
  myLog({required String msg}){
    log(msg, name: runtimeType.toString());
  }
}