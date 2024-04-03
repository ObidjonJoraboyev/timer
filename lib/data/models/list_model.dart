import 'data_model.dart';

class ListModel {
  final String transferDate;
  final List<DataModel> data;

  ListModel({
    required this.transferDate,
    required this.data,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(
      transferDate: json["transfer_date"] as String? ?? "",
      data:
          (json["data"] as List?)?.map((e) => DataModel.fromJson(e)).toList() ??
              [],
    );
  }
}
