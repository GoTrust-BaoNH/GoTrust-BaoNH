import 'dart:convert';

List<DataPackagesModel> dataPackagesModelListFromRawJson(String rawJson) {
  final _json = json.decode(rawJson);
  if (_json is List) {
    return _json.map((e) => DataPackagesModel.fromJson(e)).toList();
  }
  return [];
}

class DataPackagesModel {
  DataPackagesModel({
    required this.title,
    required this.items,
  });

  factory DataPackagesModel.fromRawJson(String str) => DataPackagesModel.fromJson(json.decode(str));

  factory DataPackagesModel.fromJson(Map<String, dynamic> json) => DataPackagesModel(
        title: json['title'],
        items: List<DataPackageItem>.from(json['items'].map((x) => DataPackageItem.fromJson(x))),
      );

  final String title;
  final List<DataPackageItem> items;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'title': title,
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class DataPackageItem {
  DataPackageItem({
    required this.title,
    required this.price,
    this.isSelected = false,
  });

  factory DataPackageItem.fromRawJson(String str) => DataPackageItem.fromJson(json.decode(str));

  factory DataPackageItem.fromJson(Map<String, dynamic> json) => DataPackageItem(
        title: json['title'],
        price: json['price'],
      );

  final String title;
  final int price;
  bool isSelected;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'title': title,
        'price': price,
      };
}
