

import 'package:go_trust/resource/assets_constant/icon_constants.dart';

enum ProductEnum {
  MotoInsurance,
  OtoInsurance,
  MotoRescue,
  MedicalOnline,
  OnlineShopping,
  MobileData,
  OtoRescue,
  FlightDelay,
  GoTrustCare,
  GoTrustLive,
  GoTrustCyber,
  Healthy,
  Accident,
}

extension ProductExtension on ProductEnum {
  String get icon {
    switch (this) {
      case ProductEnum.MotoInsurance:
        return IconConstants.bhXeMay;
      case ProductEnum.MotoRescue:
        return IconConstants.cuuHoXeMay;
      case ProductEnum.MobileData:
        return IconConstants.ic4g;
      case ProductEnum.MedicalOnline:
        return IconConstants.khamBenh;
      case ProductEnum.OnlineShopping:
        return IconConstants.onlineShopping;
      case ProductEnum.OtoInsurance:
        return IconConstants.bhOto;
      case ProductEnum.OtoRescue:
        return IconConstants.cuuHoOto;
      case ProductEnum.FlightDelay:
        return IconConstants.treChuyenBay;
      case ProductEnum.GoTrustCare:
        return IconConstants.goTrustCare;
      case ProductEnum.GoTrustCyber:
        return IconConstants.goTrustCyber;
      case ProductEnum.GoTrustLive:
        return IconConstants.goTrustLive;
      case ProductEnum.Healthy:
        return IconConstants.sucKhoeVang;
      case ProductEnum.Accident:
        return IconConstants.taiNan;
      default:
        return IconConstants.bhXeMay;
    }
  }

  String get productName {
    switch (this) {
      case ProductEnum.MotoInsurance:
        return 'TNDSBB Xe máy';
      case ProductEnum.MotoRescue:
        return 'Cứu hộ xe máy 24/7';
      case ProductEnum.MobileData:
        return '3GB';
      case ProductEnum.MedicalOnline:
        return 'Khám bệnh online 24/7';
      case ProductEnum.OnlineShopping:
        return 'GoTRUST Online Shopping';
      case ProductEnum.OtoInsurance:
        return 'TNDSBB Ô tô';
      case ProductEnum.FlightDelay:
        return 'Trễ chuyến bay';
      default:
        return 'TNDSBB Xe máy';
    }
  }
}
