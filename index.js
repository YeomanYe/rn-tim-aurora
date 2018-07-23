import React from 'react';
import { AppRegistry } from 'react-native';
import { StackNavigator } from 'react-navigation';
import Entrance from './App';
import ChatRoom from './ChatRoom';
import BrowserPhotoScreen from './Image_browser';
import {name as appname} from './app.json';
import codePush from 'react-native-code-push';

export default App = StackNavigator({
    Home: {
        screen: Entrance
    },
    ChatRoom:{
      screen:ChatRoom
    },
    BrowserPhoto: {
        screen: BrowserPhotoScreen
    }
}, {
    headerMode: 'none'
})
let codePushOptions = {
    installMode:codePush.InstallMode.ON_NEXT_RESTART,
    mandatoryInstallMode:codePush.InstallMode.IMMEDIATE
};
ContainApp = codePush(codePushOptions)(App);
WrapApp = () => <ContainApp/>;
AppRegistry.registerComponent(appname, () => WrapApp);
