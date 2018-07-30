package com.timaurora.tls;

import android.content.Context;

import com.facebook.react.bridge.Promise;
import com.tencent.qalsdk.QALSDKManager;
import com.timaurora.tim.Constant;
import com.timaurora.tim.PromiseHelper;
import com.timaurora.tls.callback.PwdLoginCb;
import com.timaurora.tls.callback.StrAccRegCb;

import tencent.tls.platform.TLSErrInfo;
import tencent.tls.platform.TLSHelper;

public class AuthHelper {
    public static TLSHelper tlsHelper;
    public static void init(Context context){
        // 务必检查IMSDK已做以下初始化
        QALSDKManager.getInstance().setEnv(0);
        QALSDKManager.getInstance().init(context, Constant.SDK_APPID);

        // 初始化TLSSDK
        tlsHelper = TLSHelper.getInstance().init(context, Constant.SDK_APPID);
    }
    public static void register(String username, String pass, final Promise promise){
        // 引导用户输入合法的用户名和密码
        int result = tlsHelper.TLSStrAccReg(username, pass, new StrAccRegCb("register",promise));
        if (result == TLSErrInfo.INPUT_INVALID)
            promise.reject(PromiseHelper.createErrReject("username or pass is incorrect format"));
    }
    public static void login(String username,String pass,Promise promise){
        tlsHelper.TLSPwdLogin(username, pass.getBytes(), new PwdLoginCb("login",promise));

    }
    public static void verifyImgCode(String code,Promise promise){
        tlsHelper.TLSPwdLoginVerifyImgcode(code, new PwdLoginCb("verifyImgCode",promise));
    }
    public static void reaskImgCode(Promise promise){
        tlsHelper.TLSPwdLoginReaskImgcode(new PwdLoginCb("reaskImgcode",promise));
    }
}
