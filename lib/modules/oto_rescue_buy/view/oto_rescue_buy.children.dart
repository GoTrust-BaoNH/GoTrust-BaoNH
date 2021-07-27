part of 'oto_rescue_buy_screen.dart';

extension _BuyOtoRecusChildren on OtoRescueBuyScreen {
  Widget rescueDetailItem({
    required Widget icon,
    required String title,
    required String value,
    required String type,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: 20,
              height: 20,
              padding: const EdgeInsets.only(right: 12),
              child: icon,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              title,
              style: TextStyle(
                color: AppColor.primaryTextColorLight,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: type == 'string'
                ? Text(
                    value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.primaryTextColorLight,
                      fontSize: 14,
                    ),
                  )
                : type == 'bool'
                    ? Container(
                        child: toBool(value)
                            ? const Icon(
                                Icons.check_circle,
                                color: AppColor.primary,
                              )
                            : const Icon(Icons.radio_button_off),
                      )
                    : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
