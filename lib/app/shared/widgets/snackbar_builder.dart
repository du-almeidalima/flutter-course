import 'package:flutter/material.dart';

import 'package:firebase_chat/app/shared/utils/messages_mapper.dart';
import 'package:firebase_chat/domain/core/error.dart';
import 'package:firebase_chat/domain/core/severity_enum.dart';

class SnackBarBuilder {
  Widget call({
    @required String content,
  }) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(content),
    );
  }

  static Widget fromFailure({
    @required Failure failure,
    @required BuildContext context,
  }) {
    Color backgroundColor;

    switch (failure.severityEnum) {
      case SeverityEnum.SUCCESS:
        backgroundColor = Colors.blueAccent;
        break;
      case SeverityEnum.ALERT:
        backgroundColor = Colors.orangeAccent;
        break;
      case SeverityEnum.DANGER:
        backgroundColor = Colors.redAccent;
        break;
      default:
        backgroundColor = Colors.black26;
    }
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      content: Text(getMessageFromCode(failure.code)),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          Scaffold.of(context).hideCurrentSnackBar();
        },
      ),
    );
  }
}
