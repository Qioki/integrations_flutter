package com.example.integrations_flutter

import android.content.Context
import android.view.Gravity
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

class TextPlatformView(private val context: Context?) : PlatformView {
    private val textView: TextView = TextView(context)

    init {
        textView.text = ""
        textView.gravity = Gravity.CENTER
        textView.id = 0
    }

    override fun getView(): View {
        return textView
    }

    override fun dispose() {}
}