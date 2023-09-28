
import 'item_data.dart';

class MainData {
  App? app;
  List<Widgets>? widgets;

  MainData({this.app, this.widgets});

  MainData.fromJson(Map<String, dynamic> json) {
    app = json['app'] != null ? App.fromJson(json['app']) : null;
    if (json['widgets'] != null) {
      widgets = <Widgets>[];
      json['widgets'].forEach((v) {
        widgets!.add(Widgets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (app != null) {
      data['app'] = app!.toJson();
    }
    if (widgets != null) {
      data['widgets'] = widgets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class App {
  String? theme;

  App({this.theme});

  App.fromJson(Map<String, dynamic> json) {
    theme = json['theme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['theme'] = theme;
    return data;
  }
}

class Widgets {
  String? type;
  List<Items>? items;
  List<BannerData>? bannerItem;
  String? title;

  Widgets({this.type, this.items, this.title});

  Widgets.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['items'] != null) {
      if(json['type'] == 'banner'){
        bannerItem = <BannerData>[];
        json['items'].forEach((v) {
          bannerItem!.add(BannerData.fromJson(v));
        });
      }else{
        items = <Items>[];
        json['items'].forEach((v) {
          items!.add(Items.fromJson(v));
        });
      }

    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (items != null) {
      if(type == 'banner'){
        data['items'] = bannerItem!.map((v) => v.toJson()).toList();
      }
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    return data;
  }
}
class BannerData {
  String? type;
  String? image;
  String? color;
  String? headerText;
  late String footerText;
  bool? footerIcon;


  BannerData(
      {this.type,
        this.image,
        this.color,
        required this.headerText,
        required this.footerText,
        this.footerIcon});

  BannerData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    image = json['image'];
    color = json['color'];
    headerText = json['header_text'];
    footerText = json['footer_text'];
    footerIcon = json['footer_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['image'] = image;
    data['color'] = color;
    data['header_text'] = headerText;
    data['footer_text'] = footerText;
    data['footer_icon'] = footerIcon;
    // if (this.items != null) {
    //   data['items'] = this.items!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
class Items {
  String? type;
  String? text;
  String? image;
  List<ItemData>? items;
  String? id;
  Items({this.type, this.text, this.image});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    text = json['text'];
    image = json['image'];
    items = <ItemData>[];
    json['items'].forEach((v) {
      items?.add(ItemData.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['text'] = text;
    data['image'] = image;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}