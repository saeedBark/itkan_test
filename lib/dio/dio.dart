import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHolper {

  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(

        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData() async {
    return await dio.get(
        "https://gutendex.com/books/"
      // queryParameters: query,
    );
  }
}





// static Future<Response> gethob() async{
//
//   var respose =
//   await Dio().get("https://gutendex.com/books/") ;
//   print(respose);
// }