import { AppRegistry } from 'react-native';
import { StackNavigator } from 'react-navigation';
import Entrance from './App';
import ChatRoom from './ChatRoom';
import BrowserPhotoScreen from './Image_browser';
import {name as appname} from './app.json';

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

AppRegistry.registerComponent(appname, () => App);
