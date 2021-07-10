part of 'voucher_screen.dart';

extension VoucherChildrenExtension on EmergencyScreen {
  Widget _buildInputVoucher() {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Mã khuyến mãi'),
          TextField(
            controller: controller.textController,
            maxLines: 2,
            minLines: 1,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              color: AppThemeColor.textBlack,
              fontFamily: TextAppStyle.appFont,
            ),
            decoration: const InputDecoration(
                hintText: 'Nhập mã khuyến mãi',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: AppThemeColor.gray1,
                  fontFamily: TextAppStyle.appFont,
                ),
                alignLabelWithHint: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none),
          ),
        ]),
      ),
    );
  }

  Widget _buildQRCodeButton({required VoidCallback onQRButtonPressed}) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          color: AppThemeColor.greyE1EBE4),
      child: MaterialButton(
        onPressed: onQRButtonPressed,
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints(maxHeight: 48),
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  const Icon(
                    Icons.qr_code_scanner,
                    size: 20,
                    color: AppThemeColor.greenDark,
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 0.5,
                    color: AppThemeColor.greenDark,
                  ),
                ],
              ),
            ),
            Container(
              height: 48,
              child: Center(
                child: Text(
                  'Quét mã khuyến mãi QR Code',
                  style: TextStyle(
                    color: AppColor.primaryColorLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGetVoucherButton({required VoidCallback onButtonPressed}) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 48,
        minWidth: double.infinity,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: AppThemeColor.greyE1EBE4,
      ),
      child: MaterialButton(
        onPressed: onButtonPressed,
        child: Center(
          child: Text(
            'Nhận mã khuyến mãi',
            style: TextStyle(
              color: AppColor.primaryColorLight,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
