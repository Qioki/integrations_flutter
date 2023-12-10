package com.example.integrations_flutter

import android.widget.TextView
import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val methodChannelId = "CALL_METHOD"
    private val intentMessageId = "CALL"
    private val textViewId = "TEXT_VIEW_ID"



    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        flutterEngine.platformViewsController.registry.registerViewFactory(textViewId, TextPlatformViewFactory())

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannelId).setMethodCallHandler {
                call, result ->

            if (call.method == intentMessageId) {
                val textView = findViewById<TextView>(0)
                if (textView != null) {
                    val args = call.arguments as Map<*, *>
                    val text = args["text"].toString()
                    textView.text = text
                    textView.refreshDrawableState()
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
