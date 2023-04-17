import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:impinge_task/model/Owner.dart';
import 'package:impinge_task/module/home/controller/home_controller.dart';
import 'package:impinge_task/module/home/widgets/list_view_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Impinge Solutions'),
        backgroundColor: Color(0xffF3713A),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx(
            () => Column(
              children: [
                for (Owner data in controller.ownerList)
                  ListviewWidget(
                      title: data.displayName ?? '',
                      image: data.profileImage ?? '',
                      onTap: () {
                        Get.bottomSheet(
                          bottomSheetWidget(
                              selectedImage: data.profileImage ?? '',
                              name: data.displayName ?? '_'),
                          backgroundColor: Colors.white,
                          isDismissible: false,
                        );
                      }).paddingSymmetric(horizontal: 20, vertical: 12)
              ],
            ),
          )),
    ));
  }

  Widget bottomSheetWidget(
      {required String selectedImage, required String name}) {
    return Container(
      height: 300,
      child: Column(
        children: [
          SizedBox(height: 40),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(selectedImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            name,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 30),
          InkWell(
            onTap: () => Get.back(),
            child: Text(
              'OK',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.blueAccent),
            ),
          )
        ],
      ),
    );
  }
}
