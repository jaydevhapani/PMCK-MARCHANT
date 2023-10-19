import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart';
import 'package:rewardz/models/orders.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static final url = Uri.parse('http://pmckadmin.co.za/api-portal/');
  static String username = 'apiportal';
  static String password = 'secret';
  static String basicAuth =
      'Basic ${base64Encode(utf8.encode('$username:$password'))}';

  static Map<String, String> header = {
    'content-type': 'application/json',
    'Authorization': basicAuth
  };

  Api();

  Future<bool> login(String email, String password) async {
    // String fcmToken = await FirebaseMessaging.instance.getToken() ?? "";
    final per = await SharedPreferences.getInstance();
    Map<String, dynamic> body = {
      "action": "RESTAURANT_LOGIN",
      "email": email,
      "password": password,
      'device': "fcm"
    };

    Response response = await post(
      url,
      headers: header,
      body: json.encode(body),
    );
    final data = jsonDecode(response.body);

    if (apiStatus(data['status'])) {
      per.setString('userId', data['data']['id']);
      per.setBool("login", true);
      per.setString('res', data['data']['restaurant']);
      return true;
    }
    return false;
  }

  Future<Orders?> getOrders() async {
    final per = await SharedPreferences.getInstance();
    final res = per.getString("res");

    Map<String, dynamic> body = {"action": "RESTAURANT_ORDERS", 'res_id': res};

    Response response = await post(
      url,
      headers: header,
      body: json.encode(body),
    );

    final data = jsonDecode(response.body);

    if (data == null || data['status'] != 'success') {
      return Orders();
    }

    if (data['data'] is List) {
      var list = data['data'] as List;
      if (list.isEmpty) {
        return Orders();
      }
    }

    var orders = Orders.fromJson(data['data']);

    return orders;
  }

  Future<bool> updateOrderStatus(String orderId, String status) async {
    final per = await SharedPreferences.getInstance();
    final user = per.getString("userId");
    Map<String, dynamic> body = {
      "action": "UPDATE_ORDER_STATUS",
      'orderId': orderId,
      'status': status,
      'userId': user
    };

    Response response = await post(
      url,
      headers: header,
      body: json.encode(body),
    );

    final data = jsonDecode(response.body);

    return apiStatus(data['status']);
  }

  bool apiStatus(String status) {
    return status != null && status == "success";
  }
}
