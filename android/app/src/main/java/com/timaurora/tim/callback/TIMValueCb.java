package com.timaurora.tim.callback;

import com.facebook.react.bridge.Promise;
import com.tencent.TIMValueCallBack;
import com.timaurora.tim.PromiseHelper;

public class TIMValueCb<T> extends BaseCb implements TIMValueCallBack<T> {

    public TIMValueCb(String name, Promise promise){
        super(name,promise,TIMValueCb.class.getSimpleName());
    }

    public TIMValueCb(Promise promise){
        super(promise,TIMValueCb.class.getSimpleName());
    }

    @Override
    public void onSuccess(T t) {
        this.onSuccess();
    }
}
