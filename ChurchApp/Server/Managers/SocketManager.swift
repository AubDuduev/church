//
//  SocketManager.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation
import SwiftWebSocket

class SocketManager {
  
  static let shared = SocketManager()
  
  private let server   = Server()
  private var webSocket: WebSocket!
  private let token    = GVuserData.token ?? "no token"
  private let decoding = JSONString()
  
  public var deleteMessage: ClousureTwo<[CODMessage]?, Int>!
  public var newMessage   : Clousure<[CODMessage]?>!
  public var allMessage   : Clousure<[CODMessage]?>!
  
  public func connect(chatID: String = ""){
    let url = server.urls.create(type: .socket(token: self.token, chatID: chatID, fromMessageID: ""))!.URL!
    self.webSocket = WebSocket(url: url)
    self.webSocket?.event.error = { error in
      print("error webSocket \(error)")
    }
    self.webSocket?.event.open = {
      print("opened webSocket")
    }
  }
  public func get(){
    self.webSocket.event.message = { (message) in
      if let messageString = message as? String {
        print(messageString)
        self.decoding.parse(string: messageString, jsonType: DECSocket.self) { (decSocket) in
          guard decSocket.error == nil else { return }
          //Удаляем сообщения
          if let command = decSocket.command {
            switch command.action {
              case "hide":
                guard let messgeID = command.messageID else { return }
                self.deleteMessage?(decSocket.messages, messgeID)
              default:
                break
            }
            //Получаем все сообщения
          } else if decSocket.schedule != nil {
            self.allMessage?(decSocket.messages)
            //Получаем новые сообщения
          } else {
            self.newMessage?(decSocket.messages)
          }
        }
      }
    }
  }
  public func send(message: CODMessage){
    do {
      let data = try JSONEncoder().encode(message)
      self.webSocket.send(data: data)
    } catch let error {
      print("Error send message class SocketManager , description - ", error.localizedDescription)
    }
  }
  public func clouse(){
    self.webSocket?.close()
  }
  private init(){ }
}
