// ignore_for_file: strict_raw_type

import 'package:flutter/material.dart';
import 'package:waffarha_challenge/app/data/api_manager/api_manager.dart';
import 'package:waffarha_challenge/l10n/l10n.dart';

extension FailureHandler on Failure {
  String toMessage(BuildContext context) {
    final failure = this;
    if (failure is ErrorFailure) {
      final error = failure.error;
      if (error is MessageResponseModel) {
        return error.message;
      }
    }
    var retriable = false;
    if (failure is ConnectionFailure) retriable = true;
    return retriable
        ? context.l10n.no_connection
        : context.l10n.try_again_later;
  }
}
