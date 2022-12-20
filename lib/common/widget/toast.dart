import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../app_colors.dart';

class Toast {
  showToast(String? msg) {
    Fluttertoast.showToast(
        msg: msg.toString(),
        webBgColor: "linear-gradient(to right, #319416, #319416)",
        textColor: AppColors.whiteColor,
        webPosition: 'center');
  }

  errorToast(
    String? msg,
  ) {
    Fluttertoast.showToast(
        msg: msg.toString(),
        textColor: AppColors.whiteColor,
        webBgColor: "linear-gradient(to right, #dc1c13, #dc1c13)",
        webPosition: 'center');
  }
}
