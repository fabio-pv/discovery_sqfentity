import 'package:database_test/database/database_model.dart';

class Category extends CategoryDB {
  Category({
    int? id,
    String? name,
    String? lastName,
  }) : super(
          id: id,
          name: name,
          lastName: lastName,
        );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        /*id: json['id'] as int,*/
        name: json['name'] as String,
        lastName: json['lastName'] as String,
      );
}
