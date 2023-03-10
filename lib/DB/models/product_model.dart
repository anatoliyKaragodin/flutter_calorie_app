const String tableProducts = 'products';

/// User data column names
class ProductModelFields {
  /// Add all fields
  static const List<String> values = [
    columnId,
    columnLabel,
    columnCalories,
    columnProteins,
    columnFats,
    columnCarbohydrates,
    columnCreatedDate
  ];

  static const String columnId = '_id';
  static const String columnLabel = 'label';
  static const String columnCalories = 'calories';
  static const String columnProteins = 'proteins';
  static const String columnFats = 'fats';
  static const String columnCarbohydrates = 'carbohydrates';
  static const String columnCreatedDate = 'createdDate';
}

/// User data model
class ProductModel {
  final int? id;
  final String label;
  final double calories;
  final double proteins;
  final double fats;
  final double carbohydrates;
  final DateTime createdDate;
  const ProductModel({
    this.id,
    required this.label,
    required this.calories,
    required this.proteins,
    required this.fats,
    required this.carbohydrates,
    required this.createdDate,
  });

  /// From Map method
  static ProductModel fromMap(Map<String, Object?> map) => ProductModel(
        id: map[ProductModelFields.columnId] as int?,
        label: map[ProductModelFields.columnLabel] as String,
        calories: map[ProductModelFields.columnCalories] as double,
        proteins: map[ProductModelFields.columnProteins] as double,
        fats: map[ProductModelFields.columnFats] as double,
        carbohydrates: map[ProductModelFields.columnCarbohydrates] as double,
        createdDate:
            DateTime.parse(map[ProductModelFields.columnCreatedDate] as String),
      );

  /// To Map method
  Map<String, Object?> toMap() => {
        ProductModelFields.columnId: id,
        ProductModelFields.columnLabel: label,
        ProductModelFields.columnCalories: calories,
        ProductModelFields.columnProteins: proteins,
        ProductModelFields.columnFats: fats,
        ProductModelFields.columnCarbohydrates: carbohydrates,
        ProductModelFields.columnCreatedDate: createdDate.toIso8601String()
      };

  /// Copy method
  ProductModel copy({
    int? id,
    String? label,
    double? calories,
    double? proteins,
    double? fats,
    double? carbohydrates,
    DateTime? createdDate,
  }) =>
      ProductModel(
          id: id ?? this.id,
          label: label ?? this.label,
          calories: calories ?? this.calories,
          proteins: proteins ?? this.proteins,
          fats: fats ?? this.fats,
          carbohydrates: carbohydrates ?? this.carbohydrates,
          createdDate: createdDate ?? this.createdDate);
}
