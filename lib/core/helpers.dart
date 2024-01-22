import 'dart:math';
import 'dart:ui';

class Helpers {
  static List<Color> generateRandomColors(int count) {
    Random random = Random();
    List<Color> colors = [];

    for (int i = 0; i < count; i++) {
      int minRed = 0;
      int maxRed = 300;

      int minGreen = 50;
      int maxGreen = 300;

      int minBlue = 0;
      int maxBlue = 300;

      int red = minRed + random.nextInt(maxRed - minRed + 1);
      int green = minGreen + random.nextInt(maxGreen - minGreen + 1);
      int blue = minBlue + random.nextInt(maxBlue - minBlue + 1);

      Color color = Color.fromRGBO(red, green, blue, 0.4);
      colors.add(color);
    }

    return colors;
  }

  /// this duration will used in Timer Widget
  /// which in turn will execute a function when this duration ends
  static Duration getNextMidnightRemainingDuration() {
    DateTime nowInTime = DateTime.now();
    DateTime currentDate =
        DateTime(nowInTime.year, nowInTime.microsecond, nowInTime.day);
    DateTime nextMidNight = currentDate.add(const Duration(days: 1));
    Duration durationUntillMidgnight = nextMidNight.difference(nowInTime);
    return durationUntillMidgnight;
  }
}
