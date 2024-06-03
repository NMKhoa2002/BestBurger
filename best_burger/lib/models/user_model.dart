class UserModel {
  final String uId;
  final String userName;
  final String email;
  final String phone;
  final String userImg;
  final bool isAdmin;
  final bool isActive;
  final dynamic createdOn;

  UserModel({
    required this.uId,
    required this.userName,
    required this.email,
    required this.phone,
    required this.userImg,
    required this.isAdmin,
    required this.isActive,
    required this.createdOn,
  });

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'userName': userName,
      'email': email,
      'phone': phone,
      'userImg': userImg,
      'isAdmin': isAdmin,
      'isActive': isActive,
      'createdOn': createdOn,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      userName: json['userName'],
      email: json['email'],
      phone: json['phone'],
      userImg: json['userImg'],
      isAdmin: json['isAdmin'],
      isActive: json['isActive'],
      createdOn: json['createdOn'].toString(),
    );
  }
}
