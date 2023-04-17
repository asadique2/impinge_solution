import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:impinge_task/model/DataModel.dart';
import 'package:impinge_task/model/Owner.dart';

class HomeController extends GetxController {
  RxList<Owner> ownerList = RxList([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    final dio = Dio();
    try {
      final response = await dio.get(
          'https://api.stackexchange.com/2.3/answers?order=desc&sort=activity&site=stackoverflow');

      if (response.statusCode == 200 || response.statusCode == 201) {
        DataModel data = DataModel.fromJson(response.data);
        data.items?.forEach((item) {
          Owner owner = Owner(
            accountId: item.owner?.accountId,
            reputation: item.owner?.reputation,
            userId: item.owner?.userId,
            profileImage: item.owner?.profileImage,
            displayName: item.owner?.displayName,
            link: item.owner?.link,
          );
          ownerList.add(owner);
        });
      } else {
        log(response.statusMessage ?? 'something went wrong');
      }
    } on DioError catch (exception) {
      log(exception.toString());
    }
  }
}
