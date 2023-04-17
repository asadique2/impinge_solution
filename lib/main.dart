import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:impinge_task/module/home/controller/home_controller.dart';

import 'my_app.dart';

void main() {
  Get.put(HomeController());
  runApp(const MyApp());
}
