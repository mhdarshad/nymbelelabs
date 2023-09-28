class ItemData {
  String? id;
  String? text;
  String? price;
  String? image;

  ItemData({this.id, this.text, this.price, this.image});

  ItemData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    price = json['price'];
    image = json['image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
