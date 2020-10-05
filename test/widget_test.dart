import 'package:flutter_test/flutter_test.dart';
import 'package:venten/models/filter.dart';
import 'package:venten/util.dart';

void main() {
  test('Should filter CSV file and print out filtered list', () async {
    // Setup

    Filter filterModel = Filter(
      colors: ['Rose Gold'],
    );

    // Action
    List carOwners = await Util.filterCsv(filterModel);

    // Result
    expect(carOwners.isEmpty, true);
  });
}
