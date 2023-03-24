import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:bad_protection/api/detection_model.dart';
import 'package:bad_protection/pages/state.dart';
import 'package:bad_words/bad_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MainController extends GetxController {
  MainController();
  final title = "HowAreYou .";
  final state = MainState();
  final filter = Filter();
  final tcontroller = TextEditingController();
  bool showImage = true;
  final Urlcontroller = TextEditingController();
  @override
  void onReady() {
    super.onReady();
  }

  verifiText() async {
    if (filter.isProfane(tcontroller.text)) {
      Get.snackbar("Bad Word Detected", "please use only applicable words",
          backgroundColor: Colors.white, colorText: Colors.red);
    } else {
      Get.snackbar("Ok its good", "Your text Verified",
          backgroundColor: Colors.white, colorText: Colors.green);
    }
  }

  Future<Detector?> submitImage(String Url) async {
    var url = "https://api.apilayer.com/nudity_detection/url?url=${Url}";
    var headers = {"apikey": "ImQLbgKzX4QIx4vDAF4FdxKA2AnOYnjf"};

    var response = await http.get(Uri.parse(url), headers: headers);

    int statusCode = response.statusCode;
    String result = utf8.decode(response.bodyBytes);
    Map<String, dynamic> data = jsonDecode(response.body);
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    if (data['value'] <= 2) {
      state.showImage;
      Urlcontroller.clear();
      EasyLoading.dismiss();
    } else {
      Get.snackbar("Unsafe image Detected", "Use reguler images Only.........",
          backgroundColor: Colors.white,
          colorText: Color.fromARGB(255, 141, 9, 9));
      Urlcontroller.clear();
      EasyLoading.dismiss();
    }
    print(result);
    print(statusCode);
  }

  // verifiImage() async {
  //   await submitImage(Urlcontroller.text);
  //   if (state.showImage == true) {
  //     showImage = true;
  //     tcontroller.clear();
  //   } else {
  //     Get.snackbar("Unsafe image Detected", "Use reguler images Only.........",
  //         backgroundColor: Colors.white, colorText: Colors.green);
  //   }
  // }

  //var response = http.post(uri, body: "data");
}
