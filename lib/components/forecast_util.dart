import 'package:intl/intl.dart';

class Util {
   // 'weather_forecast' API Key
  static String appId = "8c79813fab497fd44be9c9eeb919dedf";

  static String getFormattedDate(DateTime dateTime) {

    return new DateFormat("EEEE, MMM d, y").format(dateTime);
    //... 1999
  }


}