part of 'your_product_screen.dart';

extension YourProductChildrenExtension on YourProductScreen {
  Widget _listProduct({
    required void Function(YourProductModel) onItemPressed,
  }) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: controller.list.length,
      itemBuilder: (context, index) {
        final item = controller.list[index];
        return ProductItem(
            productType: item.productType,
            productName: item.productName,
            contractCode: item.contractCode,
            expiredDate: item.expiredDate,
            price: item.price,
            isContractProcessing: item.isContractProcessing,
            onRenewButtonPressed: () {},
            onItemPressed: () => onItemPressed(item));
      },
    );
  }

  Widget get _buildHorizontalTabs => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomTab(
          items: [
            'all'.tr,
            'in_effect'.tr,
            'wait_approval'.tr,
            'expired_soon'.tr,
          ],
          activeItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: const Color(0xff83DCA7).withOpacity(0.2),
          ),
        ),
      );
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    required this.productType,
    required this.productName,
    required this.onItemPressed,
    required this.onRenewButtonPressed,
    Key? key,
    this.contractCode,
    this.price,
    this.expiredDate,
    this.isContractProcessing = false,
  }) : super(key: key);

  final ProductEnum productType;
  final String productName;
  final String? contractCode;
  final String? price;
  final String? expiredDate;
  final bool isContractProcessing;
  final VoidCallback onItemPressed;
  final VoidCallback onRenewButtonPressed;

  VoidCallback? get renewButtonPressed => isContractProcessing ? null : onRenewButtonPressed;

  Widget _buildButton() {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 36,
        maxWidth: 80,
      ),
      child: AppGradientButton(
        onPressed: renewButtonPressed,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Text(
          'extension'.tr,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontFamily: TextAppStyle.appFont,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onItemPressed,
        child: Container(
          height: 124,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: Wrap(
                  runSpacing: 4,
                  alignment: WrapAlignment.center,
                  children: [
                    FCoreImage(
                      productType.icon,
                      width: 48,
                      height: 48,
                    ),
                    _buildButton(),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 3,
                child: isContractProcessing
                    ? _buildProcessing()
                    : BuildProductDetailWidget(productName: productName, contractCode: contractCode, price: price, expiredDate: expiredDate),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProcessing() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColor.textBlack,
              fontFamily: TextAppStyle.appFont,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'wait_application_approval'.tr,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColor.gray1,
              fontFamily: TextAppStyle.appFont,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildProductDetailWidget extends StatelessWidget {
  const BuildProductDetailWidget({
    required this.productName,
    Key? key,
    this.contractCode,
    this.price,
    this.expiredDate,
  }) : super(key: key);
  final String productName;
  final String? contractCode;
  final String? price;
  final String? expiredDate;

  Widget getLabelText(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColor.gray1,
        fontFamily: TextAppStyle.appFont,
      ),
    );
  }

  Widget valueText(String? value) {
    return Text(
      value ?? '',
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColor.textBlack,
        fontFamily: TextAppStyle.appFont,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  bool isExpiredDate() {
    if (expiredDate != null) {
      final timeNow = DateTime.now().add(
        const Duration(days: 7),
      );
      final expiredTime = DateTime.parse(expiredDate!);
      if (expiredTime.isAfter(timeNow)) {
        return false;
      }
    }
    return true;
  }

  String get getTime {
    if (expiredDate != null) {
      const formatDate = 'dd/MM/yyyy';
      final oldDate = DateTime.parse(expiredDate!);
      final time = DateFormat(formatDate).format(oldDate);
      return time;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      children: [
        Text(
          productName,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.textBlack,
            fontFamily: TextAppStyle.appFont,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getLabelText('${'contract_code'.tr}: '),
            valueText(
              contractCode,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getLabelText('${'value'.tr}: '),
            valueText(
              price,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getLabelText('${'effect'.tr}: '),
            Text(
              getTime,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: isExpiredDate() ? AppColor.accent : AppColor.primary,
                fontFamily: TextAppStyle.appFont,
              ),
            )
          ],
        )
      ],
    );
  }
}
