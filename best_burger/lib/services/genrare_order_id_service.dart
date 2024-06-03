import 'dart:math';

String genetateOrderId() {
  DateTime now = DateTime.now();

  int randomNumbers = Random().nextInt(99999);
  String id = '${now.microsecondsSinceEpoch}_$randomNumbers';

  return id;
}
