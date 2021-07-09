import 'dart:async';

import 'package:api_demo2/model/image.dart';
import 'package:api_demo2/services/apicall.dart';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  RxBool isLoading = true.obs;
  RxList imageList = <Images>[].obs;
  RxString url = 'photos'.obs;
  RxString error = "" .obs;
  RxBool isNetworkAvailable = true.obs;
  DioServices dioServices = DioServices();
  StreamSubscription? sub;

  @override
  void onInit() {
    error.value = "";
    sub = Connectivity().onConnectivityChanged.listen((r) {
      isNetworkAvailable(r != ConnectivityResult.none);
    });
    fetchImages();
    super.onInit();
  }

  @override
  void dispose(){
    sub!.cancel();
    super.dispose();

  }

  void fetchImages() async {
    try {
      isLoading(true);
      List images = await dioServices.getAPI(url.toString());
      if (images != null) {
        imageList.value = images;
        print(images);
      }
    } catch (e) {
      error.value = e.toString();
      print(e);
    } finally {
      isLoading(false);
    }
  }

}
