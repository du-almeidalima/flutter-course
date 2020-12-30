import 'package:firebase_chat/domain/core/severity_enum.dart';
import 'package:flutter/foundation.dart';

class Failure {
  final String code;
  final SeverityEnum severityEnum;

  const Failure({
    @required this.code,
    @required this.severityEnum,
  });
}
