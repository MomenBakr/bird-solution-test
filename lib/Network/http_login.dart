import 'dart:convert';
import 'dart:ui';

import 'package:bird_solution_task/Modules/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as httpp ;


class HttpAuth extends GetxController{

  final box = GetStorage();

  Future login({required String email,required String password})async{

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = httpp.Request('POST', Uri.parse('https://my-safe-space.alacrity.technology/api/login'));
    request.body = json.encode({
      "email": "${email}",
      "password": "${password}"
    });
    request.headers.addAll(headers);

    httpp.StreamedResponse response = await request.send();

    if (response.statusCode == 202) {
      var result = await response.stream.bytesToString();
      var formattedResult =jsonDecode(result);
      box.write('token', '${formattedResult['access_token']}');
      print(box.read('token'));
      Get.to(HomeScreen());
    }
    else {
      var result = await response.stream.bytesToString();
      var formattedResult =jsonDecode(result);
      print(formattedResult['message']);
      Get.snackbar(
          'Warning',
          '',
        messageText: Text(
          '${formattedResult['message']}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10.sp,
        duration: Duration(seconds: 4),
      );
    }


  }



}