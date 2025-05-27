extension DateFormatter on DateTime {
  /// Format date to "dd - MM - yyyy"
  String toDayMonthYear() => '$day - $month - $year';

  /// Format date to "hh:mm a"
  String toHourMinute() {
    final hour = this.hour > 12 ? this.hour - 12 : this.hour;
    final minute = this.minute.toString().padLeft(2, '0');
    final amPm = this.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $amPm';
  }

  /// Format date to "dd - MM - yyyy hh:mm a"
  String toDayMonthYearHourMinute() {
    final hour = this.hour > 12 ? this.hour - 12 : this.hour;
    final minute = this.minute.toString().padLeft(2, '0');
    final amPm = this.hour >= 12 ? 'PM' : 'AM';
    return '$day/$month/$year   -   $hour:$minute $amPm';
  }

// this format %Y-%m-%d %H:%M:%S'
  String toSqlDateTime() {
    final year = this.year.toString().padLeft(4, '0');
    final month = this.month.toString().padLeft(2, '0');
    final day = this.day.toString().padLeft(2, '0');
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    final second = this.second.toString().padLeft(2, '0');
    return '$year-$month-$day $hour:$minute:$second';
  }

}
