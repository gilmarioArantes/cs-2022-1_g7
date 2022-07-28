import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class UtilDate {
  static String getDayMonthYear({num? dataMilis, DateTime? dateTime}) {
    try {
      var formatter = DateFormat('dd/MM/yyyy');
      return formatter.format(
          dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!.toInt()));
    } catch (e) {
      return '00/00/00';
    }
  }

  static num daysBetween(
      {DateTime? inicio, num? inicioMilis, DateTime? fim, num? fimMilis}) {
    try {
      var dateA =
          inicio ?? DateTime.fromMillisecondsSinceEpoch(inicioMilis!.toInt());
      var dateB = fim ?? DateTime.fromMillisecondsSinceEpoch(fimMilis!.toInt());
      dateA = dateA.subtract(Duration(
          hours: dateA.hour,
          minutes: dateA.minute,
          seconds: dateA.second,
          milliseconds: dateA.millisecond));
      dateB = dateB.subtract(Duration(
          hours: dateB.hour,
          minutes: dateB.minute,
          seconds: dateB.second,
          milliseconds: dateB.millisecond));
      return dateA.difference(dateB).inDays;
    } catch (e) {
      return 0;
    }
  }

  

  static DateTime formatMMSS({Duration? duration, num? segundos}) {
    duration = duration ?? Duration(seconds: segundos!.toInt());
    var date = DateTime.now();
    date = date.subtract(Duration(
        hours: date.hour,
        minutes: date.minute,
        seconds: date.second,
        milliseconds: date.millisecond));
    date.add(duration);
    return date;
  }

  static String getSegundosFromMinSegundoString(String tempo) {
    try {
      String min = tempo.split(':')[0];
      String sec = tempo.split(':')[1];
      String tem = ((int.parse(min) * 60) + int.parse(sec)).toString();
      return tem;
    } catch (e) {
      return tempo;
    }
  }

  static String getMinSecs({Duration? duration, num? segundos}) {
    try {
      duration = duration ?? Duration(seconds: segundos!.toInt());
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(99));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return '$twoDigitMinutes:$twoDigitSeconds';
    } catch (e) {
      return '--:--';
    }
  }

  static String getApenasMinSecs({Duration? duration, num? segundos}) {
    try {
      var oneNumberHour =
          (duration ?? Duration(seconds: segundos?.toInt() ?? 0))
                  .toString()
                  .split('.')
                  .first
                  .split(':')
                  .first
                  .length ==
              1;
      return '${oneNumberHour ? '0' : ''}${(duration ?? Duration(seconds: segundos?.toInt() ?? 0)).toString().split('.').first}';
    } catch (e) {
      return '00:00:00';
    }
  }

  static DateTime? formatHHMMString(String time) {
    try {
      return DateFormat('HH:mm:ss').parse(time);
    } catch (e) {
      return null;
    }
  }

  static String formatDataToDatabase(date) {
    String day = date.split('/')[0];
    String month = date.split('/')[1];
    String year = date.split('/')[2];
    return '$year-$month-$day';
  }
}

class TimeTextInputFormatter extends TextInputFormatter {
  TimeTextInputFormatter({this.sufixText}) {
    _exp = RegExp(r'^[0-9:]+$');
  }
  late RegExp _exp;
  String? sufixText;
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (_exp.hasMatch(newValue.text.replaceAll(
        (sufixText?.isNotEmpty ?? false) ? ' $sufixText' : '', ''))) {
      TextSelection newSelection = newValue.selection;

      String value = newValue.text.replaceAll(' $sufixText', '');
      String newText;

      String leftChunk = '';
      String rightChunk = '';

      if (value.length >= 8) {
        if (value.substring(0, 7) == '00:00:0') {
          leftChunk = '00:00:';
          rightChunk = value.substring(leftChunk.length + 1, value.length);
        } else if (value.substring(0, 6) == '00:00:') {
          leftChunk = '00:0';
          rightChunk = value.substring(6, 7) + ':' + value.substring(7);
        } else if (value.substring(0, 4) == '00:0') {
          leftChunk = '00:';
          rightChunk = value.substring(4, 5) +
              value.substring(6, 7) +
              ':' +
              value.substring(7);
        } else if (value.substring(0, 3) == '00:') {
          leftChunk = '0';
          rightChunk = value.substring(3, 4) +
              ':' +
              value.substring(4, 5) +
              value.substring(6, 7) +
              ':' +
              value.substring(7, 8) +
              value.substring(8);
        } else {
          leftChunk = '';
          rightChunk = value.substring(1, 2) +
              value.substring(3, 4) +
              ':' +
              value.substring(4, 5) +
              value.substring(6, 7) +
              ':' +
              value.substring(7);
        }
      } else if (value.length == 7) {
        if (value.substring(0, 7) == '00:00:0') {
          leftChunk = '';
          rightChunk = '';
        } else if (value.substring(0, 6) == '00:00:') {
          leftChunk = '00:00:0';
          rightChunk = value.substring(6, 7);
        } else if (value.substring(0, 1) == '0') {
          leftChunk = '00:';
          rightChunk = value.substring(1, 2) +
              value.substring(3, 4) +
              ':' +
              value.substring(4, 5) +
              value.substring(6, 7);
        } else {
          leftChunk = '';
          rightChunk = value.substring(1, 2) +
              value.substring(3, 4) +
              ':' +
              value.substring(4, 5) +
              value.substring(6, 7) +
              ':' +
              value.substring(7);
        }
      } else {
        leftChunk = '00:00:0';
        rightChunk = value;
      }

      if (oldValue.text.isNotEmpty && oldValue.text.substring(0, 1) != '0') {
        if (value.length > 7) {
          return oldValue;
        } else {
          leftChunk = '0';
          rightChunk = value.substring(0, 1) +
              ':' +
              value.substring(1, 2) +
              value.substring(3, 4) +
              ':' +
              value.substring(4, 5) +
              value.substring(6, 7);
        }
      }

      newText = leftChunk + rightChunk;

      newSelection = newValue.selection.copyWith(
        baseOffset: math.min(newText.length, newText.length),
        extentOffset: math.min(newText.length, newText.length),
      );

      return TextEditingValue(
        text:
            '$newText${(sufixText?.isNotEmpty ?? false) ? ' $sufixText' : ''}',
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return TextEditingValue(
      text: newValue.text,
      selection: newValue.selection,
      composing: TextRange.empty,
    );
  }
}
