import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rewardz/Screens/new.dart';
import 'package:rewardz/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  Api api = Api();
  Rx<bool> isLogin = false.obs;

  Rx<bool> isLoading = false.obs;
  var email = TextEditingController().obs;
  var password = TextEditingController().obs;

  Future<void> onInit() async {
    // TODO: implement onInit
    await checkLogin();

    super.onInit();
  }

  Future<void> checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var bo = preferences.getBool("isLogin");
    if (bo != null) {
      isLogin.value = bo;
      Get.to(() => newOrder());
      update();
    }
  }

  Future<bool> login(String email, String password) {
    isLoading.value = true;
    update();
    final login = api.login(email, password);
    isLoading.value = true;
    update();
    return login;
  }
}
