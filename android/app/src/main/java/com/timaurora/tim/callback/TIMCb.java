package com.timaurora.tim.callback;

import android.util.Log;

import com.facebook.react.bridge.Promise;
import com.tencent.TIMCallBack;
import com.timaurora.tim.PromiseHelper;

public class TIMCb extends BaseCb implements TIMCallBack {

    public TIMCb(Promise p){
        super(p,TIMCb.class.getSimpleName());
    }
    public TIMCb(String name, Promise p){
        super(name,p,TIMCb.class.getSimpleName());
    }
}
