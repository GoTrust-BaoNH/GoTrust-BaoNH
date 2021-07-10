part of 'voucher_screen.dart';

extension VoucherActioneExtension on EmergencyScreen {
  Future<void> scanQRCode() async {
    try {
      controller.qrCodeResult = await FlutterBarcodeScanner.scanBarcode(
        '#FFFB6107',
        'Cancel',
        false, //show flash icon
        ScanMode.QR,
      );
    } on PlatformException {
      controller.qrCodeResult = 'Failed to get platform version.';
    }
  }
}
