part of 'borrow_data_detail.dart';

extension _BorrowDataDetailChildren on BorrowDataDetailScreen {
  Widget customTextField({required TextEditingController controller}) {
    return Stack(
      children: [
        Container(
          decoration: ThemeDecoration.textFieldWithShadow,
          height: 60,
          width: Get.width,
        ),
        Container(
          height: 60,
          margin: const EdgeInsets.only(left: 16, right: 40),
          child: Center(
            child: TextField(
              controller: controller,
              maxLines: 1,
              style: TextStyle(
                color: AppColor.primaryTextColorLight,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 60,
            width: 24,
            margin: const EdgeInsets.only(right: 16),
            child: const Center(
              child: FCoreImage(
                IconConstants.edit,
                width: 24,
                height: 24,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget dataPackagesList({required DataPackagesModel data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            data.title,
            style: TextStyle(
              color: AppColor.primaryColorLight,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List<Widget>.generate(data.items.length, (index) => dataButton(data: data.items[index], onTap: () {
            // print
          })),
        )
      ],
    );
  }

  Widget dataButton({
    required DataPackageItem data,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 104,
        height: 84,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: data.isSelected ? AppThemeColor.greenF1FFF4 : AppThemeColor.grayF2F2F2,
          border: data.isSelected ? Border.all(color: AppThemeColor.primary, width: 2) : null,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data.title,
                    style: TextStyle(
                      color: AppColor.primaryTextColorLight,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      formatVnd(data.price.toString()),
                      style: TextStyle(
                        color: AppColor.primaryHintColorLight,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
            data.isSelected
                ? const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        Icons.check_circle,
                        color: AppThemeColor.primary,
                        size: 18,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
