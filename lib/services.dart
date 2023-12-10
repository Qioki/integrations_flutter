import 'package:flutter/services.dart';

class PlatformService {
  static const methodChannelId = 'CALL_METHOD';
  static const intentMessageId = 'CALL';
  final method = const MethodChannel(methodChannelId);

  Future<void> setText(String text) async {
    try {
      await method.invokeMethod(intentMessageId, {'text': text});
    } on PlatformException catch (e) {
      print("Failed to invoke method: '${e.message}'.");
    }
  }
}
