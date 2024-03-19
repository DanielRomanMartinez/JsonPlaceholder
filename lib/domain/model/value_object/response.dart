import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class Response extends Equatable {
  final int statusCode;
  final String body;
  final Uint8List bodyBytes;
  final Map<String, String> headers;

  const Response({
    required this.statusCode,
    required this.body,
    required this.bodyBytes,
    required this.headers,
  });

  Map<String, dynamic> toMap() => {
        'statusCode': statusCode,
        'body': body,
        'bodyBytes': bodyBytes,
        'headers': headers,
      };

  factory Response.fromMap(Map<String, dynamic> map) => Response(
        statusCode: map['statusCode'],
        body: map['body'],
        bodyBytes: map['bodyBytes'],
        headers: map['headers'],
      );

  @override
  List<Object?> get props => [
        statusCode,
        body,
        bodyBytes,
        headers,
      ];
}
