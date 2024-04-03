import 'package:timer/data/models/sender_model.dart';

class DataModel {
  final int transactionCode;
  final String date;
  final int incomeId;
  final double amount;
  final int cardId;
  final SenderModel sender;

  DataModel({
    required this.amount,
    required this.cardId,
    required this.date,
    required this.incomeId,
    required this.sender,
    required this.transactionCode,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      amount: json["amount"] as double? ?? 0.0,
      cardId: json["card_id"] as int? ?? 0,
      date: json["date"] as String? ?? "",
      incomeId: json["income_id"] as int? ?? 0,
      sender: SenderModel.fromJson(json["sender"] as Map<String, dynamic>),
      transactionCode: json["transaction_code"] as int? ?? 0,
    );
  }
}
