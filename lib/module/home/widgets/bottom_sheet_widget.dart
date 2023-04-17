import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bottomSheetWidget(
    {required String selectedImage, required String name}) {
  return SizedBox(
    height: 300,
    child: Column(
      children: [
        const SizedBox(height: 40),
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
        const SizedBox(height: 20),
        Text(
          name,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 30),
        InkWell(
          onTap: () => Get.back(),
          child: const Text(
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
