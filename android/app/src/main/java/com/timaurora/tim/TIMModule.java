package com.timaurora.tim;

import android.os.Environment;
import android.util.Log;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.tencent.TIMCallBack;
import com.tencent.TIMLogLevel;
import com.tencent.TIMManager;


public class TIMModule extends ReactContextBaseJavaModule {
    private static final String TAG = "TIMModule";
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
        Log.d(TAG,"initSDK");
        //初始化 SDK 基本配置
        TIMManager tim = TIMManager.getInstance();
        tim.setLogLevel(TIMLogLevel.DEBUG);
        tim.disableCrashReport();
        tim.initLogSettings(true,Environment.getExternalStorageDirectory().getPath()+"/tim_log/");

        //初始化 SDK
        tim.init(this.rContext);
    }
    @ReactMethod
    public void login(String identifier,String userSig){
        TIMManager.getInstance().login(identifier, userSig, new TIMCallBack() {
            @Override
            public void onError(int code, String desc) {
                Log.d(TAG, "login failed. code: " + code + " errmsg: " + desc);
            }

            @Override
            public void onSuccess() {
                Log.d(TAG, "login succ");
            }
        });
    }
}
