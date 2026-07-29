import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

/// A minimal [HttpClientAdapter] test double. Records the last request it
/// received and replies with a scripted status/body, so tests can assert on
/// outgoing headers without touching the network.
class FakeHttpClientAdapter implements HttpClientAdapter {
  RequestOptions? lastRequest;
  int responseStatusCode = 200;
  dynamic responseBody = const <String, dynamic>{};

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    lastRequest = options;
    final bytes = utf8.encode(jsonEncode(responseBody));
    return ResponseBody.fromBytes(
      bytes,
      responseStatusCode,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
