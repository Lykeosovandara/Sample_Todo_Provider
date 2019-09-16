import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/utils/http.dart';

void main() {
  dio.interceptors.add(alice.getDioInterceptor());
  runApp(App());
}
