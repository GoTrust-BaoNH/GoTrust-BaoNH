part of 'emergency_screen.dart';

extension EmergencyChildrenExtension on EmergencyScreen {
  Widget _listHotline({required Function(EmergencyModel) onItemPressed}) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Wrap(
        runSpacing: 32,
        children: List<Widget>.generate(
          controller.list.length,
          (index) {
            final item = controller.list[index];
            return _hotlineItem(
                serviceName: item.serviceName!, servicePhoneNumber: item.phone!, onItemPressed: () => onItemPressed(item));
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
    return Column(
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
      ],
    );
  }
}
