import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = new Dio();

  addMovie(name, actor, actress, director, yearOfRelease) async {
    try {
      return await dio.post('https://moviedbfp.herokuapp.com/addMovie',
          data: {
            'name': name,
            'actor': actor,
            'actress': actress,
            'director': director,
            'yearOfRelease': yearOfRelease
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: "Error : ${e.message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color(0xFFE53935),
          textColor: Color(0xFFFFFFFF),
          fontSize: 16.0);
    }
  }
}
