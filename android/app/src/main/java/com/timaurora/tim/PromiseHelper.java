package com.timaurora.tim;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.WritableMap;

public class PromiseHelper {
    public static WritableMap createResolve(String msg, int code){
        WritableMap map = Arguments.createMap();
        map.putString("msg",msg);
        map.putInt("code",code);
        return map;
    }
}
