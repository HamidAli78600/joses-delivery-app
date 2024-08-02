import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:joses_delivery_app/services/api_utils.dart';
import 'package:joses_delivery_app/utils/storage_helper.dart';

class ApiService extends GetxService {
  static const baseUrl = 'https://manifest.digitalupgraders.com/api/';

  Map<String, String> _headers(bool withToken) {
    final headers = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    if (withToken) {
      headers['Authorization'] = 'Bearer ${StorageHelper.userAccessToken}';
    }
    return headers;
  }

  Future<http.Response> request({
    required String apiEndPoint,
    Map<String, dynamic>? data,
    bool withToken = true,
    bool isPost = false,
    bool isGet = false,
    bool isDelete = false,
  }) async {
    dynamic body = isPost ? json.encode(data) : null;
    late http.Response response;
    if (isPost) {
      response = await http.post(Uri.parse('${ApiUtils.baseUrl}$apiEndPoint'), headers: _headers(withToken), body: body);
    }
    else if (isGet) {
      response = await http.get(Uri.parse('${ApiUtils.baseUrl}$apiEndPoint'), headers: _headers(withToken));
    }
    else if (isDelete) {
      response = await http.delete(Uri.parse('${ApiUtils.baseUrl}$apiEndPoint'), headers: _headers(withToken));
    }
    return response;
  }

  Future<http.Response> uploadImage({required String apiEndPoint, required File imageFile,}) async {
    var uri = Uri.parse('$baseUrl$apiEndPoint');
    var request = http.MultipartRequest('POST', uri)
      ..headers.addAll(_headers(true))
      ..files.add(http.MultipartFile(
        'image', imageFile.readAsBytes().asStream(),
        await imageFile.length(),
        filename: imageFile.path.split('/').last,));
    return await http.Response.fromStream(await request.send());
  }

}
