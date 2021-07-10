import 'dart:convert';

class PaymentMethodModel {
  PaymentMethodModel({
    required this.image,
    required this.title,
  });

  factory PaymentMethodModel.fromRawJson(String str) => PaymentMethodModel.fromJson(json.decode(str));

  factory PaymentMethodModel.fromMock() => PaymentMethodModel.fromJson(json.decode(paymentMethodMock));

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) => PaymentMethodModel(
        image: json['image'],
        title: json['title'],
      );

  final String image;
  final String title;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'image': image,
        'title': title,
      };
}

const paymentMethodMock = '''
{
"image": "assets/images/alepay.png",
"title": "Thanh toán vằng ví điện tử Ale pay"
}
''';
