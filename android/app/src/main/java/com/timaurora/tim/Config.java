package com.timaurora.tim;

import android.content.Context;
import android.os.Environment;
import android.util.Log;

import com.tencent.TIMLogLevel;
import com.tencent.TIMManager;

public class Config {
    private static String tag = Config.class.getSimpleName();
    static void initSdk(Context context){
        Log.d(tag,"initSdk");
        //初始化 SDK 基本配置
        TIMManager tim = TIMManager.getInstance();
        tim.setLogLevel(TIMLogLevel.DEBUG);
        tim.disableCrashReport();
        tim.initLogSettings(true, Environment.getExternalStorageDirectory().getPath()+"/tim_log/");

        //初始化 SDK
        tim.init(context);
    }
}
