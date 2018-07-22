import React, {Component} from 'react';
import {FlatList, Linking, Text, TouchableOpacity, View,} from 'react-native';
import TIM from './js/TIM';

TIM.initSDK();
export default class Test extends Component {
    componentDidMount() {
    }
    async loginTest10010(){
        await TIM.loginTest10010();
        await TIM.chatWithSingle('test10011');
        this.props.navigation.navigate('ChatRoom');
    }
    async loginTest10011(){
        await TIM.loginTest10011();
        await TIM.chatWithSingle('test10010');
        this.props.navigation.navigate('ChatRoom');
    }
    render() {
        const {
            navigate
        } = this.props.navigation;
        const data = [
            {handler: () => this.loginTest10010(), text: 'test10010登录'},
            {handler: () => this.loginTest10011(), text: 'test10011登录'},
        ];
        return (
            <FlatList data={data}
                      keyExtractor={(item, index) => index.toString()}
                      contentContainerStyle={{alignItems: 'center'}}
                      renderItem={({item}) => (
                          <TouchableOpacity
                              onPress={item.handler}>
                              <View style={[styles.btn]}>
                                  <Text style={[styles.btnText]}>{item.text}</Text>
                              </View>
                          </TouchableOpacity>
                      )}/>
        )
    }
}
const styles = {
    btn: {
        display: 'flex',
        backgroundColor: 'white',
        width: 270,
        marginTop: 35,
        marginBottom: 20,
        padding: 5,
        borderRadius: 15
    },
    btnText: {
        fontSize: 20,
        margin: 'auto',
        alignItems: 'center',
        textAlign: 'center',
        color: 'rgb(62,167,186)',
    }
};
