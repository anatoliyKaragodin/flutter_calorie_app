
const String tableUserDataStart = 'userDataStart';
const String tableUserData = 'userData';

/// User data column names
class UserDataModelFields {
  /// Add all fields
  static const List<String> values = [
    columnId,
    columnIsMale,
    columnHeight,
    columnWeight,
    columnAge,
    columnCreatedDate
  ];

  static const String columnId = '_id';
  static const String columnIsMale = 'isMale';
  static const String columnAge = 'age';
  static const String columnHeight = 'height';
  static const String columnWeight = 'weight';
  static const String columnCreatedDate = 'createdDate';
}

/// User data model
class UserDataModel {
  final int? id;
  final bool isMale;
  final int age;
  final int height;
  final double weight;
  final DateTime createdTime;
  const UserDataModel(
      {this.id,
      required this.isMale,
      required this.age,
      required this.height,
      required this.weight,
      required this.createdTime});

  /// From Map method
  static UserDataModel fromMap(Map<String, Object?> map) => UserDataModel(
      id: map[UserDataModelFields.columnId] as int?,
      isMale: map[UserDataModelFields.columnIsMale] == 1,
      age: map[UserDataModelFields.columnAge] as int,
      height: map[UserDataModelFields.columnHeight] as int,
      weight: map[UserDataModelFields.columnWeight] as double,
      createdTime: DateTime.parse(map[UserDataModelFields.columnCreatedDate] as String),
  );

  /// To Map method
  Map<String, Object?> toMap() => {
        UserDataModelFields.columnId: id,
        UserDataModelFields.columnIsMale: isMale ? 1 : 0,
        UserDataModelFields.columnHeight: height,
        UserDataModelFields.columnWeight: weight,
        UserDataModelFields.columnAge: age,
        UserDataModelFields.columnCreatedDate: createdTime.toIso8601String()
      };

  /// Copy method
  UserDataModel copy({
    int? id,
    bool? isMale,
    int? age,
    int? height,
    double? weight,
    DateTime? createdTime,
  }) =>
      UserDataModel(
          id: id ?? this.id,
          isMale: isMale ?? this.isMale,
          age: age ?? this.age,
          height: height ?? this.height,
          weight: weight ?? this.weight,
          createdTime: createdTime ?? this.createdTime);

  // UserDataModel.fromMap(Map<String, dynamic> map) {
  //   // id = map[columnId] as int?;
  //   title = map[columnTitle] as String?;
  //   isMale = map[columnIsMale] == 1;
  //   age = map[columnAge] as int?;
  //   height = map[columnHeight] as int?;
  //   weight = map[columnWeight] as double?;
  // }
}
