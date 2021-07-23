part of 'emergency_screen.dart';

extension EmergencyChildrenExtension on EmergencyScreen {
  Widget _listHotline({required Function(EmergencyModel) onItemPressed}) {
    return Scrollbar(
      controller: controller.scrollController,
      child: NotificationListener<ScrollEndNotification>(
        onNotification: (scrollEnd) {
          final metrics = scrollEnd.metrics;
          if (metrics.atEdge) {
            if (metrics.pixels == 0) {
              print('At top ListView');
            } else {
              if (controller.canLoadingMore) {
                controller.pageNumber.value = controller.pageNumber.value + 1;
                controller.getListEmergency();
              }
            }
          }
          return true;
        },
        child: ListView.builder(
          itemCount: controller.emergencyList.length,
          controller: controller.scrollController,
          itemBuilder: (context, index) {
            final item = controller.emergencyList.value[index];
            return _hotlineItem(serviceName: item.serviceName!, servicePhoneNumber: item.phone!, onItemPressed: () => onItemPressed(item));
            ;
          },
        ),
      ),
    );
  }

  Widget _hotlineItem({
    required String serviceName,
    required String servicePhoneNumber,
    required VoidCallback onItemPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onItemPressed,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                color: Color(0xffF5D7C6),
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.phone,
                          color: Color(0xffFF6B00),
                        ),
                      ),
                      Container(
                        color: const Color(0xffFF6B00),
                        width: 0.5,
                        height: 40,
                      )
                    ],
                  ),
                  Container(
                    height: 40,
                    child: Center(
                      child: Text(
                        servicePhoneNumber,
                        style: const TextStyle(
                          color: Color(0xffFF6B00),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            serviceName,
            style: TextStyle(
              color: AppColor.primaryHintColorLight,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
