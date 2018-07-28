package com.timaurora.tls.callback;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.WritableMap;
import com.timaurora.tim.PromiseHelper;
import com.timaurora.tls.AuthHelper;

import tencent.tls.platform.TLSErrInfo;
import tencent.tls.platform.TLSPwdLoginListener;
import tencent.tls.platform.TLSUserInfo;

public class PwdLoginCb implements TLSPwdLoginListener {
    private String name;
    private Promise promise;
    public PwdLoginCb(String tag, Promise promise){
        this.name = tag;
        this.promise = promise;
    }
    @Override
    public void OnPwdLoginSuccess(TLSUserInfo tlsUserInfo) {
        String userSig = AuthHelper.tlsHelper.getUserSig(tlsUserInfo.identifier);
        String msg = name + "succ. userSig:" + userSig;
        WritableMap map = Arguments.createMap();
        map.putString("msg",msg);
        map.putInt("code",200);
        map.putString("userSig",userSig);
        promise.resolve(map);
    }

    @Override
    public void OnPwdLoginReaskImgcodeSuccess(byte[] bytes) {
        /* 请求刷新图片验证码成功，此时需要用picData 更新验证码图片，原先的验证码已经失效*/
        String msg = name + "succ ";
        promise.resolve(PromiseHelper.createSucResolve(msg));
    }

    @Override
    public void OnPwdLoginNeedImgcode(byte[] bytes, TLSErrInfo tlsErrInfo) {
        //登录需要验证码
        String msg = name + " need imgcode";
        WritableMap map = Arguments.createMap();
        map.putString("msg",msg);
        map.putInt("code",201);
        promise.resolve(map);
    }

    @Override
    public void OnPwdLoginFail(TLSErrInfo tlsErrInfo) {
        String msg = name + " fail. code:" + tlsErrInfo.ErrCode + ",msg:" + tlsErrInfo.Msg;
        promise.reject(PromiseHelper.createErrReject(msg));
    }

    @Override
    public void OnPwdLoginTimeout(TLSErrInfo tlsErrInfo) {
        String msg = name + " fail. code:" + tlsErrInfo.ErrCode + ",msg:" + tlsErrInfo.Msg;
        promise.reject(PromiseHelper.createErrReject(msg));
    }
}
