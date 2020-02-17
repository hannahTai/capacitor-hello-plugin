package com.example.plugin;

import android.widget.Toast;
import com.getcapacitor.JSObject;
import com.getcapacitor.NativePlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import android.content.Context;

@NativePlugin()
public class HelloToastPlugin extends Plugin {

    @PluginMethod()
    public void showToast(PluginCall call) {
         // 取得資料
         String data = call.getString("data");
         String msg = data.concat(" went through Android NativePlugin.");
         System.out.println("Say hi form android! " + msg);
         // 做點native的事
         Context ctx = this.bridge.getContext();
         Toast.makeText(ctx, msg, Toast.LENGTH_LONG).show();
         // 回傳資料
         JSObject returnValue = new JSObject();
         returnValue.put("msg", msg);
         // 成功
         call.success(returnValue);
         // 失敗
         // call.reject("...");
         // 結束
         // call.resolve();
    }
}
