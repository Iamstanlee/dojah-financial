library flutter_dojah_financial;

import 'package:flutter/material.dart';
import 'package:flutter_dojah_financial/webview_screen.dart';

class DojahFinancial {
  final String appId;
  final String publicKey;
  final String type;
  final Map<String, dynamic> user_data;
  final Map<String, dynamic> config;
  final Function(dynamic)? onCloseCallback;
  // final Function(String)? amount;
  

  DojahFinancial({
    required this.appId,
    required this.publicKey,
    required this.type,
    required this.user_data,
    required this.config,
    // this.amount,
    this.onCloseCallback,
  });

  Future<void> open(BuildContext context,
      {Function(dynamic result)? onSuccess,
      Function(dynamic error)? onError}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebviewScreen(
          appId: appId,
          publicKey: publicKey,
          type: type,
          user_data: user_data,
          config: config,
          // amount: amount,
          success: (result) {
            onSuccess!(result);
          },
          error: (error) {
            onError!(error);
          },
        ),
      ),
    );
  }
}
