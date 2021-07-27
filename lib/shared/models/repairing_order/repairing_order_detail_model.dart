import 'package:go_trust/shared/models/city_model/city_model.dart';
import 'package:go_trust/shared/models/district_model/district_model.dart';
import 'package:go_trust/shared/models/repairing_customer_model/repairing_customer_info_model.dart';
import 'package:go_trust/shared/models/repairing_customer_model/repairing_customer_order_model.dart';
import 'package:go_trust/shared/models/repairing_customer_model/repairing_partner_customer_company_model.dart';
import 'package:go_trust/shared/models/repairing_customer_model/repairing_partner_worker_company_model.dart';
import 'package:go_trust/shared/models/repairing_service_model/repairing_image_model.dart';
import 'package:go_trust/shared/models/ward_model/ward_model.dart';

class RepairingOrderDetailModel {
  RepairingOrderDetailModel({
    required this.id,
    required this.service,
    this.city,
    this.createdAt,
    this.customerAddress,
    this.customerInfo,
    this.customerName,
    this.customerOrder,
    this.customerPhone,
    this.description,
    this.district,
    this.externalId,
    this.images,
    this.name,
    this.orderCosts,
    this.partnerCustomerCompany,
    this.partnerWorkerCompany,
    this.publishedAt,
    this.status,
    this.updatedAt,
    this.uuid,
    this.ward,
  });

  CityModel? city;
  String? createdAt;
  String? customerAddress;
  RepairingCustomerInfoModel? customerInfo;
  String? customerName;
  RepairingCustomerOrderModel? customerOrder;
  String? customerPhone;
  String? description;
  DistrictModel? district;
  String? externalId;
  int id;
  List<RepairingImageModel?>? images;
  String? name;
  List<String?>? orderCosts;
  RepairingPartnerCustomerCompanyModel? partnerCustomerCompany;
  RepairingPartnerWorkerCompanyModel? partnerWorkerCompany;
  String? publishedAt;
  int service;
  String? status;
  String? updatedAt;
  String? uuid;
  WardModel? ward;
}
