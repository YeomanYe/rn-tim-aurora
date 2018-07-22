package com.timaurora.tim.callback;

import android.util.Log;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.WritableMap;
import com.tencent.TIMElem;
import com.tencent.TIMElemType;
import com.tencent.TIMImageElem;
import com.tencent.TIMMessage;
import com.tencent.TIMSoundElem;
import com.tencent.TIMTextElem;
import com.tencent.TIMValueCallBack;
import com.tencent.TIMVideoElem;
import com.timaurora.tim.PromiseHelper;
import com.timaurora.tim.helper.ChatHelper;

import java.util.List;

public class TIMValueCb<T> extends BaseCb implements TIMValueCallBack<T> {

    public TIMValueCb(String name, Promise promise){
        super(name,promise,TIMValueCb.class.getSimpleName());
    }

    public TIMValueCb(Promise promise){
        super(promise,TIMValueCb.class.getSimpleName());
    }

    public WritableMap resolveTIMMsg(TIMMessage t){
        WritableMap map = Arguments.createMap();
        Long timestamp = t.timestamp();
        String msgId = t.getMsgId();
        Boolean isSelf = t.isSelf();
        map.putDouble("timestamp",timestamp);
        map.putString("msgId",msgId);
        map.putString("status","send_succeed");
        WritableMap userMap = Arguments.createMap();
        if(!isSelf) {
            map.putBoolean("isOutgoing",false);
            userMap.putString("userId",t.getSender());
        }
        else {
            map.putBoolean("isOutgoing",true);
            userMap.putString("userId","");
        }
        userMap.putString("avatarPath","images");
        userMap.putString("displayName","");
        map.putMap("fromUser",userMap);
        TIMElem timElem = t.getElement(0);

        String msgType = "invalid";
        switch (timElem.getType()){
            case Text:
                msgType = "text";
                map.putString("text",((TIMTextElem)timElem).getText());
                break;
            case Sound:
                msgType = "voice";
                map.putString("path",((TIMSoundElem)timElem).getPath());
                map.putDouble("duration",((TIMSoundElem)timElem).getDuration());
                break;
            case Video:
                msgType = "video";
                map.putString("path",((TIMVideoElem)timElem).getVideoPath());
                break;
            case Image:
                msgType = "image";
                map.putString("path",((TIMImageElem)timElem).getPath());
                break;
        }
        map.putString("msgType",msgType);
        return map;
    }

    public WritableMap createTIMMsgResolve(T t){
        String msg = operateName+" succ.";
        Log.d(this.tag, msg);
        WritableMap map = Arguments.createMap();
        map.putString("msg",msg);
        map.putInt("code",200);
        if(t instanceof TIMMessage){
            TIMMessage timMsg = (TIMMessage)t;
            map.putMap("timMsg",resolveTIMMsg(timMsg));
        }else if(t instanceof List){
            //此处获取消息记录
            List<TIMMessage> timMsgs = (List)t;
            WritableArray array = Arguments.createArray();
            for(TIMMessage timMsg:timMsgs){
                array.pushMap(resolveTIMMsg(timMsg));
                ChatHelper.lastMsg = timMsg;
            }
            map.putArray("timMsg",array);
        }
        return map;
    }

    @Override
    public void onSuccess(T t) {
        this.promise.resolve(createTIMMsgResolve(t));
    }
}
