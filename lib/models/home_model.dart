class HomeModel {
  late List<Orders>? orders;

  HomeModel({ this.orders = const []});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? code;
  String? district;
  String? id;
  String? name;
  String? status;
  int? fee;
  String? name_product;
  // String? date;
  int? phone;
  String? email;
  String? address;
  String? city;

  Orders({
    this.code,
    this.district,
    this.id,
    this.name,
    this.status,
    this.fee,
    this.name_product,
    // this.date,
    this.phone,
    this.email,
    this.address,
    this.city
  });

  Orders.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    district = json['district'];
    id = json['id'];
    name = json['name'];
    status = json['status'];
    fee = json['fee'];
    name_product = json['name_product'];
    // date = json['date'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['district'] = district;
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['fee'] = fee;
    data['name_product']=name_product;
    // data['date']=date;
    data['phone']=phone;
    data['email']=email;
    data['address']=address;
    data['city']=city;
    return data;
  }
}
