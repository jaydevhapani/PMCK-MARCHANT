class UserModel {
  String? name;
  int? id;
  int? restaurantId;

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'] as int;
    restaurantId = json['restaurant'];
  }
}
