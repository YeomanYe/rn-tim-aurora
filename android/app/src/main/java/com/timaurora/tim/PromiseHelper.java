package com.timaurora.tim;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.WritableMap;

public class PromiseHelper {
    public static WritableMap createSucResolve(String msg){
        WritableMap map = Arguments.createMap();
        map.putString("msg",msg);
        map.putInt("code",200);
        return map;
    }
    public static Throwable createErrReject(String msg){
        return new Throwable(msg);
    }
}
