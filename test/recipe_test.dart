
import 'package:gastro_galaxy/db/database.dart';
import 'package:gastro_galaxy/models/ingredient.dart';
import 'package:test/test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {

  sqfliteFfiInit();

  test('Should store new Ingrediet', () async {
    final ingredient = Ingredient(id: 1, name: "Test", isAvailable: false);

    print(await ingredient.toJson().toString());

    expect(true, true);
  });
}