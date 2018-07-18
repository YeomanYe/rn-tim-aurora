import { AppRegistry } from 'react-native';
import { StackNavigator } from 'react-navigation';
import ChatScreen from './App';
import BrowserPhotoScreen from './Image_browser';
import {name as appname} from './app.json';

export default App = StackNavigator({
    Home: {
        screen: ChatScreen
    },
    BrowserPhoto: {
        screen: BrowserPhotoScreen
    }
}, {
    headerMode: 'none'
})

AppRegistry.registerComponent(appname, () => App);
