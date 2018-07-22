package com.timaurora.tim.helper;

import com.facebook.react.bridge.Promise;
import com.tencent.TIMManager;
import com.tencent.TIMUser;
import com.timaurora.tim.Constant;
import com.timaurora.tim.callback.TIMCb;

public class AuthHelper {
    private static String tag = AuthHelper.class.getSimpleName();
    public static void login(String identifier, String userSig, Promise promise){
        TIMUser user = new TIMUser();
        user.setIdentifier(identifier);
        //        user.setAccountType(Constant.ACCOUNT_TYPE+"");
        TIMManager.getInstance().login(Constant.SDK_APPID,user,userSig,new TIMCb("login",promise));
    }
    public static void logout(Promise promise){
        TIMManager.getInstance().logout(new TIMCb("logout",promise));
    }
}
