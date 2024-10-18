import 'package:flutter/material.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/test_style.dart';

class ViewDetail extends StatelessWidget {
  const ViewDetail({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              _detailRow('Kênh phản hồi mong muốn:', 'Zalo'),
              const SizedBox(height: 8),
              _detailContainerRow('Trạng thái:', 'Open'),
              const SizedBox(height: 8),
              _detailRow('Phân loại:', 'Hỗ trợ khách hàng'),
              const SizedBox(height: 8),
              _detailRow('Deadline:', '2023-03-20 09:10'),
              const SizedBox(height: 8),
              _detailRow('Mức ưu tiên:', 'Bình thường'),
              const SizedBox(height: 8),
              _detailRow('Chi nhánh/ĐL phụ trách:', 'Công ty cổ phần đầu tư Đông Nam Á'),
              const Divider(
                color: AppColors.divideColor,
                thickness: 1,
              ),
              const SizedBox(height: 8),
              _detailRow('Phân loại tùy chọn:', '-'),
              const SizedBox(height: 8),
              _detailRow('Nguồn:', 'Dự án'),
              const SizedBox(height: 8),
              _detailRow('Kênh tiếp nhận:', 'Zalo'),
              const SizedBox(height: 8),
              _detailContainerRow('Tags:', 'Hỗ trợ khách hàng'),
              const SizedBox(height: 8),
              _detailContainerRow('Người theo dõi:', 'Trần thị Phương Thảo'),
              const SizedBox(height: 8),
              _detailRow('SLA:', '-'),
              const SizedBox(height: 8),
              _detailRow('Người tạo:', 'Nguyễn Văn A'),
              const SizedBox(height: 8),
              _detailRow('Thời gian tạo:', '2023-03-20 09:10:04'),
              const SizedBox(height: 8),
              _detailRow('Người cập nhật cuối:', 'Nguyễn Văn A'),
              const SizedBox(height: 8),
              _detailRow('Thời gian cập nhật cuối:', '2023-03-20 09:10:04'),
              const SizedBox(height: 8),
              _detailRow('Nhắc việc:', '15 phút sau báo lại khách hàng'),
              const SizedBox(height: 8),
              _detailRow('Vào lúc:', '2023-03-20 09:10'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.textStyleInterW400S14Grey,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.textStyleInterW500S14Black,
            textAlign: TextAlign.right,
            maxLines: null,
          ),
        ),
      ],
    );
  }

  Widget _detailContainerRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.textStyleInterW400S14Grey,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: value == "Open"
                ? Colors.yellow[800]
                : value == "Processing"
                ? Colors.orange[700]
                : value == "Closed"
                ? Colors.grey
            : value == "Sloved"
            ? Colors.grey :Colors.green[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: AppTextStyles.textStyleInterW400S11White,
          ),
        ),
      ],
    );
  }

}
