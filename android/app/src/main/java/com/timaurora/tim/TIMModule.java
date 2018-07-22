package com.timaurora.tim;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.timaurora.tim.helper.AuthHelper;
import com.timaurora.tim.helper.ChatHelper;
import com.timaurora.tim.helper.ConfigHelper;


public class TIMModule extends ReactContextBaseJavaModule {
    private static final String TAG = "TIMModule";
    private ReactApplicationContext rContext;
    public TIMModule(ReactApplicationContext reactContext){
        super(reactContext);
        this.rContext = reactContext;
    }
    @Override
    public String getName() {
        return "TIMModule";
    }
    @ReactMethod
    public void initSDK(){
        ConfigHelper.initSdk(this.rContext);
    }
    @ReactMethod
    public void login(String identifier,String userSig,Promise promise){
        AuthHelper.login(identifier,userSig,promise);
    }
    @ReactMethod
    public void logout(Promise promise){
        AuthHelper.logout(promise);
    }
    @ReactMethod
    public void chatWithSingle(String identifier){
        ChatHelper.chatWithSingle(identifier);
    }
    @ReactMethod
    public void sendText(String text,Promise promise){
        ChatHelper.sendText(text,promise);
    }
    @ReactMethod
    public void sendImg(String path,Promise promise){
        ChatHelper.sendImg(path,promise);
    }
    @ReactMethod
    public void sendSound(String path,Integer duration,Promise promise){
        ChatHelper.sendSound(path,duration,promise);
    }
    @ReactMethod
    public void sendVideo(String path,Promise promise){
        ChatHelper.sendVideo(path,promise);
    }
    @ReactMethod
    public void loginTest1(Promise promise){
        login("test10010","eJx1kEFPwjAUgO-7FU2vGra2zIGJB0CRySBZWFW8NAvtRjcHzfogLIb-7jJN3MV3-b687*V9OQghnESbQbrbHU8HENAYhdE9wsGY4ts-bIyWIgXBatlhMvTaIT5jPUtdjK6VSDNQdWdRf0xbradoqQ6gM-0rgLJA2j19xcpSdL3-Q1bnHVw98VkYPxZuCQu132TRM-M*6BKmL-vF5IZW9Xpit0bDZ8NHNpNhFIf5yjXJmXiX-I1V823BinlZFiaO8pTzhtFXf50k8btrTj5-6CVBVz*PaU*hZBjceQF2rs43g2lXtg__",promise);
    }
    @ReactMethod
    public void loinTest2(Promise promise){
        login("test10011","eJx1kEFrgzAUgO-*ipDzWJtEGx3skK2uFFwdVimegpqoYa2mGteO0f8*cYN52bt*H*97vC8LAADjYH*fFUU7NIabTy0heACQehje-WGtleCZ4aQTE0b2chzkEDKz5FWrTvKsNLKbLOx4eNRmihKyMapUv4KRvUHjHjRTevHOp97-oV5VE3z1k*fty4db0TytwzNpT9HGSS4mXLz1kWQp848yuxyu*ZOHqx0ZmPIZXaAypdE6TNzzdtewodZhULCjWMadG8Rkfdjsa5bbddo*zpJGnX4eM56CkU1XKxdaN*sbaF9XMw__",promise);
    }
}
