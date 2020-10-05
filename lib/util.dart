import 'dart:io';

import 'package:csv/csv.dart';
import 'package:venten/models/filter.dart';

class Util {
  static Future<List> filterCsv(Filter filter) async {
    File csvFile = File(csvPath);
    List filteredList = List();
    if (csvFile.existsSync()) {
      String content = await csvFile.readAsString();
      List<List<dynamic>> csvTable = CsvToListConverter().convert(content);
      // remove the HEADER ROW
      csvTable.removeAt(0);

      // Filter the Year
      if (filter.startYear != null && filter.endYear != null) {
        DateTime startDate = DateTime(filter.startYear);
        DateTime endDate = DateTime(filter.endYear, 12, 30);
        csvTable.retainWhere((element) =>
        DateTime(element[6]).isAfter(startDate) &&
            DateTime(element[6]).isBefore(endDate));
      }

      // Filter the gender
      if (filter.gender.isNotEmpty) {
        csvTable.retainWhere(
                (element) => element[8].toString().toLowerCase() == filter.gender);
      }

      // Filter the country
      if (filter.countries != null && filter.countries.isNotEmpty) {
        csvTable.retainWhere(
                (element) => filter.countries.contains(element[4].toString()));
      }

      // Filter the colors
      if (filter.colors != null && filter.colors.isNotEmpty) {
        csvTable.retainWhere(
                (element) => filter.colors.contains(element[7].toString()));
      }

      filteredList = csvTable;
    }
    return filteredList;
  }
}

String csvPath =
    '/storage/emulated/0/venten/car_ownsers_data.csv';