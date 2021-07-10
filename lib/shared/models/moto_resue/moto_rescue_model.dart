import 'dart:convert';

import 'package:go_trust/resource/assets_constant/icon_constants.dart';

class BuyMotoRescueViewModel {
  BuyMotoRescueViewModel({
    required this.price,
    required this.items,
  });

  factory BuyMotoRescueViewModel.fromRawJson(String str) => BuyMotoRescueViewModel.fromJson(json.decode(str));

  factory BuyMotoRescueViewModel.fromMock() => BuyMotoRescueViewModel.fromJson(json.decode(buyMotoRescueUnder175Mock));

  factory BuyMotoRescueViewModel.fromJson(Map<String, dynamic> json) => BuyMotoRescueViewModel(
        price: json['price'],
        items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
      );

  final int price;
  final List<Item> items;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'price': price,
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.title,
    required this.value,
    required this.type,
    required this.icon,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json['title'],
        value: json['value'],
        type: json['type'],
        icon: json['icon'],
      );

  final String title;
  final String value;
  final String type;
  final String icon;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'title': title,
        'value': value,
        'type': type,
        'icon': icon,
      };
}

const buyMotoRescueUnder175Mock = '''{
"price": 199000,
"items":[
    {
        "title":"Miễn phí vận chuyển",
		 "value":"Phạm vi 50km",
		 "type": "string",
		 "icon": "${IconConstants.truck}"
    },
	 {
        "title":"Số lần cứu hộ",
		 "value":"Không giới hạn",
		 "type": "string",
		 "icon": "${IconConstants.repair}"
    },
	 {
        "title":"Hỗ trợ tận nơi",
		 "value":"true",
		 "type": "bool",
		 "icon": "${IconConstants.location}"
    },
	 {
        "title":"Mất chìa khóa",
		 "value":"true",
		 "type": "bool",
		 "icon": "${IconConstants.key}"
    },
	 {
        "title":"Lỗi Ắc-Quy",
		 "value":"true",
		 "type": "bool",
		 "icon": "${IconConstants.power}"
    },
	 {
        "title":"Xe xì lốp",
		 "value":"true",
		 "type": "bool",
		 "icon": "${IconConstants.wheel}"
    },
	 {
        "title":"Hết xăng",
		 "value":"true",
		 "type": "bool",
		  "icon": "${IconConstants.fuel}"
    },
	 {
        "title":"Hỗ trợ qua điện thoại",
		 "value":"true",
		 "type": "bool",
		  "icon": "${IconConstants.serviceCall}"
    }
]
}''';

const buyMotoRecusUpper175Mock = '''{
"price": 499000,
"items":[
    {
        "title":"Miễn phí vận chuyển",
		 "value":"Phạm vi 300km",
		 "type": "string",
		 "icon": "${IconConstants.truck}"
    },
	 {
        "title":"Số lần cứu hộ",
		 "value":"Không giới hạn",
		 "type": "string",
		 "icon": "${IconConstants.repair}"
    },
	 {
        "title":"Hỗ trợ tận nơi",
		 "value":"true",
		 "type": "bool",
		 "icon": "${IconConstants.location}"
    },
	 {
        "title":"Mất chìa khóa",
		 "value":"true",
		 "type": "bool",
		 "icon": "${IconConstants.key}"
    },
	 {
        "title":"Lỗi Ắc-Quy",
		 "value":"true",
		 "type": "bool",
		 "icon": "${IconConstants.power}"
    },
	 {
        "title":"Xe xì lốp",
		 "value":"true",
		 "type": "bool",
		 "icon": "${IconConstants.wheel}"
    },
	 {
        "title":"Hết xăng",
		 "value":"true",
		 "type": "bool",
		  "icon": "${IconConstants.fuel}"
    },
	 {
        "title":"Hỗ trợ qua điện thoại",
		 "value":"true",
		 "type": "bool",
		  "icon": "${IconConstants.serviceCall}"
    }
]
}''';
