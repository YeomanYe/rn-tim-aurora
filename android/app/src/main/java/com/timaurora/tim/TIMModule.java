package com.timaurora.tim;

import android.os.Environment;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.tencent.imsdk.TIMLogLevel;
import com.tencent.imsdk.TIMManager;
import com.tencent.imsdk.TIMSdkConfig;


public class TIMModule extends ReactContextBaseJavaModule {
    private ReactApplicationContext rContext;
    public TIMModule(ReactApplicationContext reactContext){
        super(reactContext);
        this.rContext = reactContext;
    }
    @Override
    public String getName() {
        return "TIMModule";
    }
    @ReactMethod
    public void initSDK(){
        //初始化 SDK 基本配置
        TIMSdkConfig config = new TIMSdkConfig(Constant.SDK_APPID)
                .enableCrashReport(false)
                .enableLogPrint(true)
                .setLogLevel(TIMLogLevel.DEBUG)
                .setLogPath(Environment.getExternalStorageDirectory().getPath() + "/tim_log/");
        //初始化 SDK
        TIMManager.getInstance().init(this.rContext, config);
    }
}
