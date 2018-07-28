package com.timaurora.tls.callback;

import com.facebook.react.bridge.Promise;
import com.timaurora.tim.PromiseHelper;

import tencent.tls.platform.TLSErrInfo;
import tencent.tls.platform.TLSStrAccRegListener;
import tencent.tls.platform.TLSUserInfo;

public class StrAccRegCb implements TLSStrAccRegListener {
    private Promise promise;
    private String name;
    public StrAccRegCb(String name,Promise promise){
        this.name = name;
        this.promise = promise;
    }
    @Override
    public void OnStrAccRegSuccess(TLSUserInfo tlsUserInfo) {
        String msg = name + " succ.";
        promise.resolve(PromiseHelper.createSucResolve(msg));
    }

    @Override
    public void OnStrAccRegFail(TLSErrInfo tlsErrInfo) {
        String msg = name + " fail. code:" + tlsErrInfo.ErrCode + ",msg:" + tlsErrInfo.Msg;
        promise.reject(PromiseHelper.createErrReject(msg));
    }

    @Override
    public void OnStrAccRegTimeout(TLSErrInfo tlsErrInfo) {
        String msg = name + " fail. code:" + tlsErrInfo.ErrCode + ",msg:" + tlsErrInfo.Msg;
        promise.reject(PromiseHelper.createErrReject(msg));
    }
}
