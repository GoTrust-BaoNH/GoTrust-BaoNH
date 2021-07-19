import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewScreenState();
}

class _QRViewScreenState extends State<QRViewScreen> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildQrView(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 44,
              ),
              GestureDetector(
                onTap: () {
                  Get.back(result: null);
                },
                child: Container(
                  margin: const EdgeInsets.all(18.67),
                  height: 26.67,
                  width: 26.67,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.33),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Quét mã QR',
                      style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 28),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Đưa mã QR vào khung vuông bên dưới để quét',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    const scanArea = 275.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(borderColor: Colors.grey, borderRadius: 10, borderLength: 0, borderWidth: 0, cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      Get.back(result: scanData);
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool permission) {
    if (!permission) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
