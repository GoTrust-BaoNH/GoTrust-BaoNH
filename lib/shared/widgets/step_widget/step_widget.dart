import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/shared/constants/colors.dart';

const double _itemSize = 14;

class StepWidget extends StatelessWidget {
  const StepWidget({
    required this.currentStepIndex,
    Key? key,
  }) : super(key: key);

  final int currentStepIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            CircleItem(
              title: '1',
              status: 0 == currentStepIndex
                  ? StepStatus.Current
                  : 0 < currentStepIndex
                      ? StepStatus.Pass
                      : StepStatus.NotYet,
            ),
            Expanded(
                child: Container(
              height: 2,
              color: currentStepIndex > 0 ? const Color(0xffF5D7C6) : const Color(0xffC4C4C4),
            )),
            CircleItem(
              title: '2',
              status: 1 == currentStepIndex
                  ? StepStatus.Current
                  : 1 < currentStepIndex
                      ? StepStatus.Pass
                      : StepStatus.NotYet,
            ),
            Expanded(
                child: Container(
              height: 2,
              color: currentStepIndex > 1 ? const Color(0xffF5D7C6) : const Color(0xffC4C4C4),
            )),
            CircleItem(
              title: '3',
              status: 2 == currentStepIndex
                  ? StepStatus.Current
                  : 2 < currentStepIndex
                      ? StepStatus.Pass
                      : StepStatus.NotYet,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'info'.tr,
                style: TextStyle(
                  color: AppColor.primaryTextColorLight,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'confirm'.tr,
                style: TextStyle(
                  color: AppColor.primaryTextColorLight,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                'payment'.tr,
                style: TextStyle(
                  color: AppColor.primaryTextColorLight,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CircleItem extends StatelessWidget {
  const CircleItem({
    required this.title,
    Key? key,
    this.status = StepStatus.NotYet,
  }) : super(key: key);

  final StepStatus status;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: _itemSize,
      backgroundColor: status == StepStatus.NotYet ? const Color(0xff888888).withOpacity(0.2) : const Color(0xffF5D7C6),
      child: CircleAvatar(
        minRadius: 10,
        backgroundColor: status == StepStatus.NotYet
            ? const Color(0xffBBBBBB).withOpacity(0.2)
            : status == StepStatus.Current
                ? const Color(0xffFF6B00)
                : const Color(0xffFF6B00).withOpacity(0.2),
        child: Text(title,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: status == StepStatus.Pass ? const Color(0xffFF6B00) : Colors.white,
                )),
      ),
    );
  }
}

enum StepStatus { Pass, Current, NotYet }
