import 'dart:convert';

import 'package:sanalira_flutter_test/model/bank_model.dart';
import 'package:http/http.dart' as http;

class BankService {
  Future<BankListModel> fetchBanks() async {
    final response = await http
        .get(Uri.parse('https://api.sanalira.com/assignment'));

    if (response.statusCode == 200) {
      var jsonBody = BankListModel.fromJson(jsonDecode(response.body));

      return jsonBody;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
