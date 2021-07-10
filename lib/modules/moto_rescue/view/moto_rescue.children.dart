part of 'moto_rescue_screen.dart';

extension _RescusMotoChildren on MotoRescueScreen {
  Widget containerItem({required String title, required Widget icon}) => InkWell(
        onTap: controller.onItemPressed,
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              const SizedBox(height: 8),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColor.primaryTextColorLight,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      );
}
