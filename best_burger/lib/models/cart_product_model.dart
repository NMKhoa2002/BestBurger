// ignore_for_file: file_names

class CartModel {
  final String productId;
  final String typeId;
  final String productName;
  final String typeName;
  final String salePrice;
  final String fullPrice;
  final List productImages;
  final bool isSale;
  final String productDescription;
  final dynamic createdAt;
  final dynamic updatedAt;
  final int productQuantity;
  final double productTotalPrice;

  CartModel({
    required this.productId,
    required this.typeId,
    required this.productName,
    required this.typeName,
    required this.salePrice,
    required this.fullPrice,
    required this.productImages,
    required this.isSale,
    required this.productDescription,
    required this.createdAt,
    required this.updatedAt,
    required this.productQuantity,
    required this.productTotalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'typeId': typeId,
      'productName': productName,
      'typeName': typeName,
      'salePrice': salePrice,
      'fullPrice': fullPrice,
      'productImages': productImages,
      'isSale': isSale,
      'productDescription': productDescription,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'productQuantity': productQuantity,
      'productTotalPrice': productTotalPrice,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> json) {
    return CartModel(
      productId: json['productId'],
      typeId: json['typeId'],
      productName: json['productName'],
      typeName: json['typeName'],
      salePrice: json['salePrice'],
      fullPrice: json['fullPrice'],
      productImages: json['productImages'],
      isSale: json['isSale'],
      productDescription: json['productDescription'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      productQuantity: json['productQuantity'],
      productTotalPrice: json['productTotalPrice'],
    );
  }
}
