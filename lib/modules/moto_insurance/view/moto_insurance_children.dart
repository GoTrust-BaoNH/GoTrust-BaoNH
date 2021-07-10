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
              '''
Bảo hiểm TNDSBB của chủ xe cơ giới là giấy tờ buộc người điều khiển phương tiện ôtô,xe gắn máy phải mang theo khi tham gia giao thông.\nBảo hiểm TNDSBB có trách nhiệm bồi thường thiệt hại cho “Bên thứ 3” khi xảy ra tai nạn.''',
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
              '''
Lấy ví dụ, nếu anh A điều khiển phương tiện cơ giới gây tai nạn cho anh B thì Bảo hiểm TNDSBB có trách nhiệm bồi thường thiệt hại cho anh B theo quy định của Pháp luật.''',
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
          items: const [
            'Khi bạn có bảo hiểm',
            'Khi không có bảo hiểm',
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
                  text: 'CHI PHÍ: ',
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
                      text: ' / năm',
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
                    title: _insuranceDescription('''
Giấy chứng nhận điện tử hợp pháp, không cần mang theo thẻ giấy'''),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: _buildIcon(
                      IconConstants.bhMotoBoiThuongTaiSan,
                    ),
                    title: _insuranceDescription(
                        'Bồi thường cho tài sản của nạn nhân do gây tai nạn đến 50 triệu đồng/vụ'),
                  ),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: _buildIcon(
                        IconConstants.bhMotoBoiThuongYte,
                      ),
                      title: _insuranceDescription(
                        'Bồi thường chi phí y tế, tử vong cho nạn nhân do gây tai nạn đến 150 triệu đồng/người/vụ',
                      )),
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
                'BẤT LỢI KHI KHÔNG CÓ BẢO HIỂM TNDSBB:',
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
                    title: _insuranceDescription('''Bị phạt tiền đến 200.000đ do không có bảo hiểm khi bị kiểm tra'''),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: _buildIcon(
                      IconConstants.bhMotoBoiThuong,
                    ),
                    title: _insuranceDescription('''Tự bồi thường tài sản của nạn nhân do gây tai nạn'''),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: _buildIcon(
                      IconConstants.bhMotoTuBoithuong,
                    ),
                    title: _insuranceDescription('''Tự bồi thường chi phí y tế, tử vong cho nạn nhân do gây tai nạn'''),
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
