class ProductModel {
  final String productId;
  final String typeId;
  final String productName;
  final String typeName;
  final String fullPrice;
  final String salePrice;
  final bool isSale;
  final List productImages;
  final String productDescription;
  final dynamic createdAt;
  final dynamic updatedAt;

  ProductModel({
    required this.productId,
    required this.typeId,
    required this.productName,
    required this.typeName,
    required this.fullPrice,
    required this.salePrice,
    required this.isSale,
    required this.productImages,
    required this.productDescription,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'typeId': typeId,
      'productName': productName,
      'typeName': typeName,
      'fullPrice': fullPrice,
      'salePrice': salePrice,
      'isSale': isSale,
      'productImages': productImages,
      'productDescription': productDescription,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'],
      typeId: json['typeId'],
      productName: json['productName'],
      typeName: json['typeName'],
      fullPrice: json['fullPrice'],
      salePrice: json['salePrice'],
      isSale: json['isSale'],
      productImages: json['productImages'],
      productDescription: json['productDescription'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
