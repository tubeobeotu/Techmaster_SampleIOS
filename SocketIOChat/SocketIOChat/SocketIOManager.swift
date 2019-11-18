//
//  SocketIOManager.swift
//  SocketIOChat
//
//  Created by Nguyễn Văn Tú on 11/18/19.
//  Copyright © 2019 Nguyễn Văn Tú. All rights reserved.
//

import UIKit
import SocketIO
class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    let manager = SocketManager(socketURL: URL(string: "http://192.168.2.205:3000")!, config: [.log(true), .compress])
    var socket:SocketIOClient!
    let eventChat = "chat_message"
    let eventLogin = "login"
    let eventLogout = "logout"
    let eventUserList = "userList"
    override init() {
        super.init()
        socket = manager.defaultSocket
        listenMess(completion: nil)
        listenConnectedUsers(completion: nil)
    }
    
    func connect() {
        manager.connect()
    }
    
    func login(userName: String) {
        socket.emit(eventLogin, userName)
    }
     
    func logout() {
        socket.emit(eventLogout, "")
    }
    
    func sendMess(mess: String) {
        socket.emit(eventChat, mess)
    }
    
    func disconnect() {
        manager.disconnect()
    }
    
    func listenMess(completion: ((_ mess: Any?) -> Void)?) {
        socket.on(eventChat) {(data, ack) in
            completion?(data.first)
            print("\(data.first ?? "")")
        }
    }
    
    func listenConnectedUsers(completion: ((_ userList: Array<Dictionary<String, Any>>?) -> Void)?) {
        socket.on(eventUserList) {(data, ack) in
            if let users = data.first as? Array<Dictionary<String, Any>> {
                completion?(users)
            }
            print("\(data.first ?? "")")
        }
    }
}
