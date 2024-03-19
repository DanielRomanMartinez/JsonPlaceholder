import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:json_placeholder/domain/model/value_object/response.dart';
import 'package:json_placeholder/domain/services/http_service.dart';

@Injectable(as: HttpService)
class FlutterHttpService implements HttpService {
  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    final http.Response response = await http.get(
      url,
      headers: headers,
    );

    return Response(
      statusCode: response.statusCode,
      body: response.body,
      bodyBytes: response.bodyBytes,
      headers: response.headers,
    );
  }

  @override
  Future<Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final http.Response response = await http.delete(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );

    return Response(
      statusCode: response.statusCode,
      body: response.body,
      bodyBytes: response.bodyBytes,
      headers: response.headers,
    );
  }

  @override
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );

    return Response(
      statusCode: response.statusCode,
      body: response.body,
      bodyBytes: response.bodyBytes,
      headers: response.headers,
    );
  }

  @override
  Future<Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final http.Response response = await http.put(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );

    return Response(
      statusCode: response.statusCode,
      body: response.body,
      bodyBytes: response.bodyBytes,
      headers: response.headers,
    );
  }


}
