import 'package:flutter/material.dart';
import 'package:json_placeholder/ui/common/theme.dart';
import 'package:json_placeholder/ui/home/home.dart';

class JsonPlacerHolder extends StatelessWidget {
  const JsonPlacerHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Home(),
    );
  }
}
