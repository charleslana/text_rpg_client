import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../enums/toast_enum.dart';

bool isUser(String name) {
  return RegExp(r'^[a-zA-ZÀ-ú\d_]*$').hasMatch(name);
}

void _closeToast() {
  if (Get.isSnackbarOpen) {
    Get.back<dynamic>();
    return;
  }
}

void closeKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

Future<void> launchDiscord() async {
  final Uri url = Uri.parse('https://flutter.dev');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

void showLoading() {
  _closeToast();
  Get.dialog<dynamic>(
    WillPopScope(
      onWillPop: () async => false,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    ),
    barrierDismissible: false,
  );
}

void showToast(String message, ToastEnum toast) {
  _closeToast();
  Get.rawSnackbar(
    messageText: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: toast == ToastEnum.error ? Colors.red : Colors.green[900],
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.transparent,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    reverseAnimationCurve: Curves.easeOut,
    borderRadius: 10,
    margin: const EdgeInsets.all(15),
    animationDuration: const Duration(),
    duration: const Duration(seconds: 4),
  );
}

String numberAbbreviation(dynamic myNumber) {
  final String stringNumber = myNumber.toString();
  final double doubleNumber = double.tryParse(stringNumber) ?? 0;
  final NumberFormat numberFormat = NumberFormat.compact();
  return numberFormat.format(doubleNumber);
}

void showConfirmation(VoidCallback callback) {
  _closeToast();
  Get.defaultDialog<dynamic>(
    onConfirm: () => {
      Get.back<dynamic>(),
      callback(),
    },
    confirmTextColor: Colors.red,
    cancelTextColor: Colors.white,
    buttonColor: Colors.black,
    textCancel: 'dialog.confirmation.cancel.button'.tr,
    textConfirm: 'dialog.confirmation.confirm.button'.tr,
    title: 'dialog.confirmation.title'.tr,
    middleText: 'dialog.confirmation.content'.tr,
  );
}

void navigate(String routeName) {
  Get.toNamed<dynamic>(routeName);
}
