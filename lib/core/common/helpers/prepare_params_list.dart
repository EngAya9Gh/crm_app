Map<String, dynamic> prepareParamsList({
  required String key,
  required List<dynamic> values,
}) {
  Map<String, dynamic> map = {};

  for (int i = 0; i < values.length; i++) {
    map["$key[$i]"] = values[i];
  }

  return map;
}
