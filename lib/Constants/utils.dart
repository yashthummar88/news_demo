import 'package:intl/intl.dart';

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}

DateTime getDateFromString(String dateString, {String? formatter}) {
  //2022-04-09T10:00:00Z
  const String kMainSourceFormat = "yyyy-MM-dd'T'HH:mm:SSZ";
  if (formatter == null) {
    formatter = kMainSourceFormat;
  }
  return DateFormat(formatter).parse(dateString);
}
