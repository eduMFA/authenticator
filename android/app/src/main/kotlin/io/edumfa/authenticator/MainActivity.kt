package io.edumfa.authenticator

import android.net.Uri
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.io.ObjectInputStream

class MainActivity : FlutterFragmentActivity() {

    private val channelName = "readValueFromFile"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        // getWindow().setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE);

        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)

        channel.setMethodCallHandler { call, result ->

                try {
                    val args = call.arguments as Map<String, String>
                    val uri = Uri.parse(args["path"] as String)
                    val inputStream = applicationContext.contentResolver.openInputStream(uri)
                    val input = ObjectInputStream(inputStream)
                    when (call.method) {
                        "json" -> {
                            val entries = input.readObject() as Map<String, *>
                            result.success(entries)
                        }
                        else -> {
                            result.error("UNAVAILABLE", "Something went wrong", null)
                        }
                    }
                }
                catch (e: Exception) {
                    result.error("UNAVAILABLE", "Something went wrong", null)
                }

        }
    }
}
