import 'package:intl/intl.dart';

/// 将 RFC3339 格式的字符串解析为 DateTime 并格式化时间区间
String formatTimeRange(String? startStr, String? endStr) {
  if (startStr == null || endStr == null) {
    return "-";
  }
  if (DateTime.tryParse(startStr) == null ||
      DateTime.tryParse(endStr) == null) {
    return "-";
  }
  DateTime start = DateTime.parse(startStr); // 解析 RFC3339 字符串
  DateTime end = DateTime.parse(endStr);

  DateTime now = DateTime.now();
  DateFormat timeFormat = DateFormat('HH:mm'); // 时间格式
  DateFormat dateFormat = DateFormat('MM-dd HH:mm'); // 月-日 时间格式
  DateFormat fullFormat = DateFormat('yyyy-MM-dd HH:mm'); // 完整日期时间格式

  // 都在同一天
  if (isSameDay(start, end)) {
    if (isSameDay(start, now)) {
      // 如果在今天，只显示时间
      return '${timeFormat.format(start)} - ${timeFormat.format(end)}';
    } else {
      // 在同一天但不是今天，显示月日和时间
      return '${dateFormat.format(start)} - ${timeFormat.format(end)}';
    }
  }

  // 都在同一年
  if (isSameYear(start, end)) {
    if (isSameYear(start, now)) {
      // 在同一年但不在同一天，省略年份
      return '${dateFormat.format(start)} - ${dateFormat.format(end)}';
    } else {
      // 不在同一年，显示完整日期
      return '${fullFormat.format(start)} - ${fullFormat.format(end)}';
    }
  }

  // 不在同一年，显示完整日期
  return '${fullFormat.format(start)} - ${fullFormat.format(end)}';
}

/// 判断是否是同一天
bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

/// 判断是否是同一年
bool isSameYear(DateTime date1, DateTime date2) {
  return date1.year == date2.year;
}
