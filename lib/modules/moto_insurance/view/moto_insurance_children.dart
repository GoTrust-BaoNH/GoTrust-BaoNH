part of 'moto_insurance_screen.dart';

extension MotoInsurranceChildren on MotoInsuranceScreen {
  EdgeInsets get getPadding => const EdgeInsets.symmetric(horizontal: 16);

  Widget get _buildContentInsurance => ListView(
        children: [
          FCoreImage(
            ImageConstants.bhMotoBanner,
            fit: BoxFit.fitWidth,
            width: Get.width,
          ),
          const SizedBox(height: 16),
          _tab,
          _insuranceDetails,
          const SizedBox(height: 16),
          Padding(
            padding: getPadding,
            child: Text(
              'note_insurance_vehicle'.tr,
              style: TextStyle(
                color: AppColor.primaryTextColorLight,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: getPadding,
            child: Text(
              'example_insurance_vehicle'.tr,
              style: TextStyle(
                color: AppColor.primaryHintColorLight,
                fontSize: 11,
              ),
            ),
          ),
        ],
      );

  Widget get _tab => Center(
        child: CustomTab(
          items: [
            'has_insurance'.tr,
            'no_insurance'.tr,
          ],
          onTabChanged: controller.pageController.jumpToPage,
          itemSpace: 20,
          activeItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: const Color(0xff83DCA7).withOpacity(0.2),
          ),
        ),
      );

  Widget get _insuranceDetails => Container(
        height: 280,
        padding: getPadding,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            activatedInsurance,
            nonActivatedInsurance,
          ],
        ),
      );

  Widget get activatedInsurance => Card(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 20,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '${'cost'.tr.toUpperCase()}: ',
                  style: TextStyle(
                    color: AppColor.primaryTextColorLight,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: '66.000 VNĐ',
                      style: TextStyle(
                        color: AppColor.primaryColorLight,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' / ${'year'.tr}',
                      style: TextStyle(
                        color: AppColor.primaryHintColorLight,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: _buildIcon(
                      IconConstants.bhMotoCertificate,
                    ),
                    title: _insuranceDescription('legal_e_certificates'.tr),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: _buildIcon(
                      IconConstants.bhMotoBoiThuongTaiSan,
                    ),
                    title: _insuranceDescription('compensation_property'.trParams({'value': '50'})),
                  ),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: _buildIcon(
                        IconConstants.bhMotoBoiThuongYte,
                      ),
                      title: _insuranceDescription('compensation_medical_expenses'.trParams({'value': '150'}))),
                ],
              ),
            ],
          ),
        ),
      );

  Widget get nonActivatedInsurance => Card(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 20,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${'disadvantages_no_insurance'.tr.toUpperCase()}:',
                style: TextStyle(
                  color: AppColor.primaryTextColorLight,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: _buildIcon(
                      IconConstants.bhMotoBiPhatTien,
                    ),
                    title: _insuranceDescription('fined_up_insurance'.trParams({'value': '200.000VND'})),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: _buildIcon(
                      IconConstants.bhMotoBoiThuong,
                    ),
                    title: _insuranceDescription('self_compensation_victim_insurance'.tr),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: _buildIcon(
                      IconConstants.bhMotoTuBoithuong,
                    ),
                    title: _insuranceDescription('self_compensation_medical_insurance'.tr),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _insuranceDescription(String value) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 14,
        color: AppColor.primaryTextColorLight,
      ),
    );
  }

  Widget _buildIcon(String iconPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: FCoreImage(
        iconPath,
      ),
    );
  }
}
