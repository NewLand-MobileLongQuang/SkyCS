import 'dart:math';

import 'package:intl/intl.dart';

class StringGenerate {
  static String getCurrentTime() {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second);
    final timeCurrent = '${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}.${date.hour.toString().padLeft(2, '0')}${date.minute.toString().padLeft(2, '0')}';
    return timeCurrent;
  }

  static String getCurrentName(String name) {
    final words = name.split(' ');
    var initials = '';
    for (final word in words) {
      if (word.isNotEmpty) {
        initials += word[0].toUpperCase();
      }
    }
    return initials.length > 2 ? initials.substring(0, 2) : initials;
  }

  static String getCurrentTitle(String name) {
    final words = name.split(' ');
    var initials = '';
    for (final word in words) {
      if (word.isNotEmpty) {
        initials += word[0].toUpperCase();
      }
    }
    return initials.length > 1 ? initials.substring(0, 1) : initials;
  }

  static String addMonths(String dateStr, int monthsToAdd) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

    // Chuyển đổi chuỗi ngày thành đối tượng DateTime
    final dateTime = dateFormat.parse(dateStr);

    // Tính toán năm và tháng mới
    final newYear = dateTime.year + (dateTime.month + monthsToAdd - 1) ~/ 12;
    final newMonth = (dateTime.month + monthsToAdd - 1) % 12 + 1;

    // Tính toán ngày mới (sử dụng ngày cuối cùng của tháng nếu ngày hiện tại không tồn tại trong tháng mới)
    var newDay = dateTime.day;
    while (true) {
      try {
        final newDateTime = DateTime(newYear, newMonth, newDay, dateTime.hour, dateTime.minute, dateTime.second);
        // Nếu ngày mới hợp lệ, trả về chuỗi ngày mới
        final newDateStr = dateFormat.format(newDateTime);
        return newDateStr;
      } catch (e) {
        // Nếu ngày mới không hợp lệ, giảm ngày đi 1
        newDay--;
      }
    }
  }

  static String extractQRCode(String url) {
    // Chuyển URL thành Uri để phân tích cú pháp dễ dàng hơn
    final urlUpper = url.toUpperCase();
    final uri = Uri.parse(urlUpper);

    // Lấy giá trị của tham số 'qr' từ Uri
    final qrCode = uri.queryParameters['QR'];

    // Nếu không tìm thấy giá trị QR code, ném ngoại lệ
    if (qrCode == null) {
      throw Exception('QR code not found in URL');
    }

    return qrCode;
  }

  static String formatDuration(double seconds) {
    // Làm tròn giá trị giây về số nguyên
    final totalSeconds = seconds.round();

    // Tính số giờ, phút và giây
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final remainingSeconds = totalSeconds % 60;

    // Định dạng thành chuỗi giờ:phút:giây
    final hoursStr = hours.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');
    final secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr giờ $minutesStr phút $secondsStr giây';
  }
}

