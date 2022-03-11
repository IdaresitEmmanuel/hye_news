import 'package:flutter/material.dart';
import 'package:hye_news/injection.dart';
import 'package:hye_news/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  runApp(const AppWidget());
}
