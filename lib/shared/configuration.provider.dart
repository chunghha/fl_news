import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/configuration.dart';

final configurationProvider = FutureProvider<Configuration>((_) async {
  final content = json.decode(
    await rootBundle.loadString('assets/configuration.json'),
  ) as Map<String, Object?>;

  return Configuration.fromJson(content);
});
