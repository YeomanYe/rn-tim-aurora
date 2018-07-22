package com.timaurora.tim.callback;

import android.nfc.Tag;
import android.util.Log;

import com.facebook.react.bridge.Promise;
import com.timaurora.tim.PromiseHelper;

public class BaseCb {
    String tag;
    String operateName = "operation";
    Promise promise;
    BaseCb(String name, Promise p, String tag){
        this.operateName = name;
        this.promise = p;
        this.tag = tag;
    }
    BaseCb(Promise p,String tag){
        this.promise = p;
        this.tag = tag;
    }
    public void onError(int code, String desc) {
        String msg = operateName+" failed. code: " + code + " errmsg: " + desc;
        Log.d(this.tag, msg);
        this.promise.reject(PromiseHelper.createErrReject(msg));
    }
    public void onSuccess() {
        String msg = operateName+" succ.";
        Log.d(this.tag, msg);
        this.promise.resolve(PromiseHelper.createSucResolve(msg));
    }
}
