import 'package:flutter/material.dart';
import 'package:hye_news/injection.dart';
import 'package:hye_news/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  // font license
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const AppWidget());
}
