class ProductTypeModel {
  final String typeId;
  final String typeName;
  final String typeImage;
  final dynamic createdAt;
  final dynamic updatedAt;

  ProductTypeModel({
    required this.typeId,
    required this.typeName,
    required this.typeImage,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'typeId': typeId,
      'typeName': typeName,
      'typeImage': typeImage,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory ProductTypeModel.fromMap(Map<String, dynamic> json) {
    return ProductTypeModel(
      typeId: json['typeId'],
      typeName: json['typeName'],
      typeImage: json['typeImage'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
