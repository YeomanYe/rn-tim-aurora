package com.timaurora.tim;

import android.util.Log;

import com.facebook.react.bridge.Promise;
import com.tencent.TIMCallBack;
import com.tencent.TIMManager;
import com.tencent.TIMUser;
import com.timaurora.tim.callback.TIMCb;

public class Auth {
    private static String tag = Auth.class.getSimpleName();
    static void login(String identifier, String userSig, Promise promise){
        TIMUser user = new TIMUser();
        user.setIdentifier(identifier);
        //        user.setAccountType(Constant.ACCOUNT_TYPE+"");
        TIMManager.getInstance().login(Constant.SDK_APPID,user,userSig,new TIMCb("login",promise));
    }
}
