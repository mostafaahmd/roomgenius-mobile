// lib/core/extensions/datetime_extensions.dart

import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  // ✅ Format date/time
  String format(String pattern) {
    return DateFormat(pattern).format(this);
  }

  // ✅ Common formats
  String get toDateString => format('yyyy-MM-dd'); // 2025-11-27
  String get toTimeString => format('HH:mm'); // 14:30
  String get toDateTimeString => format('yyyy-MM-dd HH:mm');

  // ✅ Arabic-friendly formats
  String toArabicDate() => format('dd/MM/yyyy'); // 27/11/2025
  String toArabicTime() => format('hh:mm a'); // 02:30 PM

  // ✅ Time ago (relative time)
  String timeAgo({bool short = false}) {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return short ? 'now' : 'just now';
    } else if (difference.inMinutes < 60) {
      final minutes = difference.inMinutes;
      return short
          ? '${minutes}m'
          : '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      return short
          ? '${hours}h'
          : '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 7) {
      final days = difference.inDays;
      return short ? '${days}d' : '$days ${days == 1 ? 'day' : 'days'} ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return short
          ? '${weeks}w'
          : '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return short
          ? '${months}mo'
          : '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return short
          ? '${years}y'
          : '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }

  // ✅ Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  // ✅ Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  // ✅ Start and end of day
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59, 999, 999);
  }

  // ✅ Check if weekend
  bool get isWeekend {
    return weekday == DateTime.saturday || weekday == DateTime.sunday;
  }

  bool get isWeekday => !isWeekend;

  // ✅ Smart date display (like WhatsApp)
  String smartFormat() {
    if (isToday) {
      return format('HH:mm'); // 14:30
    } else if (isYesterday) {
      return 'Yesterday';
    } else {
      return format('dd/MM/yyyy'); // 27/11/2025
    }
  }
}
