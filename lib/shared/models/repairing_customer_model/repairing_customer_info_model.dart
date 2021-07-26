import 'package:go_trust/shared/models/city_model/city_model.dart';
import 'package:go_trust/shared/models/district_model/district_model.dart';
import 'package:go_trust/shared/models/ward_model/ward_model.dart';

class RepairingCustomerInfoModel {
  RepairingCustomerInfoModel({
    required this.id,
    this.address,
    this.avatar,
    this.city,
    this.countryCode,
    this.createdAt,
    this.district,
    this.email,
    this.name,
    this.phone,
    this.publishedAt,
    this.referralCode,
    this.referralId,
    this.updatedAt,
    this.uuid,
    this.ward,
  });

  String? address;
  String? avatar;
  CityModel? city;
  String? countryCode;
  String? createdAt;
  DistrictModel? district;
  String? email;
  int id;
  String? name;
  String? phone;
  String? publishedAt;
  String? referralCode;
  String? referralId;
  String? updatedAt;
  String? uuid;
  WardModel? ward;

}
