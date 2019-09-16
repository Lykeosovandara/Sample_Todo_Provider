import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sample_todo/src/utils/base_url.dart';

import 'package:alice/alice.dart';

Alice alice = Alice();

BaseOptions options = new BaseOptions(
  baseUrl:
      kReleaseMode ? BaseUrl.baseUrlProduction : BaseUrl.baseUrlDevelopment,
  connectTimeout: 10000,
  receiveTimeout: 3000,
);

Dio dio = Dio(options);

