class CustomDateUtils {
  List<DateTime> getDate(int year, int month) {
    DateTime date = DateTime(year, month);
    DateTime firstDate = DateTime(date.year, date.month, date.day);
    DateTime nextDate = DateTime(date.year, date.month + 1, date.day);
    int totalDays = nextDate.difference(firstDate).inDays;
    return List.generate(totalDays, (index) => DateTime(year, month, index+1));
  }
}
