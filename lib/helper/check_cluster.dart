import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:blockchain/const/constant.dart';
import 'package:blockchain/model/network/cluster_details.dart';

class CheckCluster {
  Future<ResponseData> fetchResponseData() async {
    final response = await http.get(Uri.parse('$BASE_URL/check_cluster'));

    if (response.statusCode == 200) {
      return ResponseData.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to load response data');
    }
  }
}
