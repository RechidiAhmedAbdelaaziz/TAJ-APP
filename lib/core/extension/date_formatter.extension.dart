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
}
