part of 'home_screen.dart';

extension _HomePageChildren on HomeScreen {
  Widget _buildPromotions(List<String> promotions) {
    return CarouselWidget(
      showIndicator: true,
      borderRadius: 0,
      items: promotions
          .map((e) => CarouselItem(
        image: e,
      ))
          .toList(),
      imageBuilder: (url, index) {
        return LayoutBuilder(builder: (
            context,
            boxConstraints,
            ) {
          const color = Colors.transparent;
          return Container(
            width: boxConstraints.maxWidth,
            height: boxConstraints.maxHeight,
            color: color,
            child: FCoreImage(
              url ?? ImageConstants.recueMotoImage,
            ),
          );
        });
      },
    );
  }

  Widget homeItem({
    required Widget icon,
    required bool isOwner,
    required String title,
  }) {
    final itemWidth = Get.width / 3 - 16 * 2;
    final iconHeight = itemWidth * 3 / 4.2;
    return InkWell(
      onTap: controller.onHomeItemPressed,
      child: Container(
        width: itemWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: Colors.red,
                    ),
                    child: isOwner
                        ? const FCoreImage(ImageConstants.homeItemContainer)
                        : const FCoreImage(
                            ImageConstants.homeItemContainerOwner,
                            // fit: BoxFit.fitHeight,
                          ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      // color: Colors.yellow,
                      height: iconHeight / 1.8,
                      child: icon,
                    ),
                  ),
                )
              ],
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.primaryTextColorLight,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bestSellerItemWidget({
    required Widget icon,
    required String imageUrl,
    required String title,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              FCoreImage(
                imageUrl,
                height: (Get.width - 16 * 2) * 2 / 5.5,
                width: Get.width,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 8, top: 8),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: icon,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Text(title),
          )
        ],
      ),
    );
  }

  Widget emergencyWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      height: Get.width / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(
            'Liên hệ khẩn cấp',
            style: TextStyle(
              color: AppColor.primaryColorLight,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List<Widget>.generate(
                controller.emergencyData.length,
                (index) => Container(
                  width: Get.width / 4 - 32,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xffFF6B00).withOpacity(0.4),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffF47458).withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: FCoreImage(
                          controller.emergencyData[index]['icon']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        controller.emergencyData[index]['title']!,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.primaryTextColorLight,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
