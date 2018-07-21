package com.timaurora.tim.callback;

import android.util.Log;

import com.facebook.react.bridge.Promise;
import com.tencent.TIMCallBack;
import com.timaurora.tim.PromiseHelper;

public class TIMCb implements TIMCallBack {
    private static String tag = TIMCb.class.getSimpleName();
    private String operateName = "operation";
    private Promise promise;
    public TIMCb(Promise p){
        this.promise = p;
    }
    public TIMCb(String name, Promise p){
        this.operateName = name;
        this.promise = p;
    }
    @Override
    public void onError(int code, String desc) {
        String msg = operateName+" failed. code: " + code + " errmsg: " + desc;
        Log.d(tag, msg);
        this.promise.reject(new Throwable(msg));
    }

    @Override
    public void onSuccess() {
        String msg = operateName+" succ.";
        Log.d(tag, msg);
        this.promise.resolve(PromiseHelper.createResolve(msg,200));
    }
}
