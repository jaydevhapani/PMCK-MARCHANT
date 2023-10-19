class Orders {
  late List<Order> orders = [];

  Orders() {
    orders = [];
  }

  Orders.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      var data = value as Map<String, dynamic>;
      data.forEach((key, value) {
        orders.add(Order.fromJson(value));
      });
    });
  }
}

class Order {
  late String orderId = "";
  late String name = "";
  late String dropzone_id = "";
  late String deliveryAddress = "";
  late String total = "";
  late String orderStatus = "";
  late String newTime = "";
  late String completeTime = "";
  late String delivTime = "";
  late String rejectTime = "";
  late String acceptTime = "";
  late String apart = "";
  late String area = "";
  late String postalCode = "";
  late String paid = "";
  late String restaurant_logo = "";
  late String restaurant_name = "";
  late String restaurant_location = "";
  late String restaurant_contact = "";
  late String order_created_date = "";
  late String order_accepted_date = "";
  late String order_cpmpleted_date = "";
  late String order_deliveried_date = "";
  late String order_rejected_date = "";
  late String membership_number = "";
  late String phone_number = "";
  late String food_note = "";
  late String delivery_note = "";
  late List<Item> Items = [];

  Order() {
    orderId = "";
    name = "";
    deliveryAddress = "";
    total = "";
    orderStatus = "";

    Items = [];
  }

  Order.fromJson(Map<String, dynamic> json) {
    var items = json['item'] != null ? json['item'] as List : [];
    orderId = json['orderId'];
    name = json['name'];
    deliveryAddress = json['delivery_address'];
    total = json['amount_total'];
    paid = json['amount_paid'];
    orderStatus = json['order_status'];
    newTime = json['newTime'];
    membership_number = json['membership_number'] ?? "";
    phone_number = json['phone_number'] ?? "";
    food_note = json['food_note'] ?? "";
    delivery_note = json['delivery_note'] ?? "";
    acceptTime = json['acceptTime'] ?? "00:00";
    completeTime = json['completeTime'] ?? "00:00";
    delivTime = json['delivTime'] ?? "00:00";
    rejectTime = json['rejectTime'] ?? "00:00";
    area = json['area'];
    apart = json['apart'];
    dropzone_id = json['dropzone_id'] ?? "";
    restaurant_logo = json['restaurant_logo'];
    restaurant_name = json['restaurant_name'];
    restaurant_location = json['restaurant_location'];
    restaurant_contact = json['restaurant_contact'];
    postalCode = json['postal_code'];
    order_created_date = json['order_created_date'] ?? "";
    order_accepted_date = json['order_accepted_date'] ?? "";
    order_accepted_date = json['order_complete_date'] ?? "";
    order_accepted_date = json['order_delivery_date'] ?? "";
    order_accepted_date = json['order_rejected_date'] ?? "";
    Items = items.map((e) => Item.fromJson(e)).toList();
  }
}

class Item {
  late String orderId = "";
  late String itemName = "";
  late String price = "";
  late String quantity = "";

  Item.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    itemName = json['itemName'];
    price = json['price'];
    quantity = json['quantity'];
  }
}
