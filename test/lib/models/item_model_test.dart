import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:premieres/models/item_model.dart';

void main() {
  late ItemModel item;

  setUp(() {
    item = ItemModel(
      id: 'your_id',
      title: 'your_title',
      imageURL: 'your_image_url',
      relaseDate: DateTime(2023, 5, 10),
    );
  });

  test('relaseDateFormatted should return the formatted release date', () {
    //1
    final formattedDate = DateFormat.yMMMEd().format(DateTime(2023, 5, 10));

    //2
    final result = item.relaseDateFormatted();
    //3
    expect(result, formattedDate);
  });

  test('daysLeft should return the correct number of days', () {
    //1
    final expectedDaysLeft =
        DateTime(2023, 5, 10).difference(DateTime.now()).inDays;

    //2
    final daysLeft = item.daysLeft();

    //3
    expect(daysLeft, expectedDaysLeft.toString());
  });
}
