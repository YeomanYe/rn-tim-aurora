package com.timaurora.tls;

import android.content.Context;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class TLSModule extends ReactContextBaseJavaModule{
    private final static String TAG = "TLSModule";
    Context context;
    TLSModule(ReactApplicationContext context){
        super(context);
        this.context = context;
    }
    @ReactMethod
    public void init(){
        AuthHelper.init(context);
    }
    @ReactMethod
    public void register(String user, String pass, Promise promise){
        AuthHelper.register(user,pass,promise);
    }

    @ReactMethod
    public void login(String user, String pass, Promise promise){
        AuthHelper.login(user,pass,promise);
    }

    @ReactMethod
    public void reaskImgCode(Promise promise){
        AuthHelper.reaskImgCode(promise);
    }

    @ReactMethod
    public void verifyImgCode(String code,Promise promise){
        AuthHelper.verifyImgCode(code,promise);
    }

    @Override
    public String getName() {
        return TAG;
    }
}
