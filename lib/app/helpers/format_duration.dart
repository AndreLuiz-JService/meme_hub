String twoDigits(int number) => number.toString().padLeft(2, "0");

String formatDuration(Duration? duration, {bool? removeHours}) {
  if (duration == null) {
    return '__:__:__';
  }

  return [
    if (removeHours != true) twoDigits(duration.inHours),
    twoDigits(duration.inMinutes.remainder(60)),
    twoDigits(duration.inSeconds.remainder(60)),
  ].join(':');
}
