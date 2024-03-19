import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:json_placeholder/application.dart';
import 'package:json_placeholder/config/injection.dart';
import 'package:json_placeholder/domain/services/start_up_service.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final startUpService = GetIt.instance.get<StartUpService>();
  await startUpService.init();

  runApp(const JsonPlacerHolder());
}
