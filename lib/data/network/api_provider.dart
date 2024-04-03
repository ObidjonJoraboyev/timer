import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/list_model.dart';
import '../my_response.dart';

class ApiProvider {
  static Future<MyResponse> fetchCountry() async {
    MyResponse myResponse = MyResponse();

    try {
      http.Response response = await http.get(Uri.parse(
          "https://banking-api.free.mockoapp.net/transactions-incomes"));
      if (response.statusCode == HttpStatus.ok) {
        myResponse.data = (jsonDecode(response.body) as List?)
                ?.map((e) => ListModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (e) {
      myResponse.errorText = e.toString();
    }

    return myResponse;
  }
}
