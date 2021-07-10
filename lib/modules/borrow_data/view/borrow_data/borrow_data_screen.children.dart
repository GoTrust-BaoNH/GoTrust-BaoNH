part of 'borrow_data_screen.dart';

extension _BorrowDataChildrenExtension on BorrowDataScreen {
  Widget customTextField({required TextEditingController controller}) {
    final width = Get.width;
    return Stack(
      children: [
        Container(
          decoration: ThemeDecoration.textFieldWithShadow,
          height: 60,
          width: width,
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

  Widget greyButton({required String title, required Function() onPressed}) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 48),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFE1EBE4),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: AppColor.primaryColorLight,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
