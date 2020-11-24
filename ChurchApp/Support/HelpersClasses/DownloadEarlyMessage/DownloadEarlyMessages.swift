//
//  DownloadEarlyMessages.swift
//  DgBetTrip
//
//  Created by Developer on 30.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class DownloadEarlyMessages {
  
  private let server                = Server()
  private var timeLastMessageUpdate: Int!
  private var timeLastMessage      : Int!
  private var saveLastMessageText  : String!
  private var controllers          : Controllers!
  private var downloadMessageNews  : DownloadMessageNews!
  private var downloadMessageChat  : DownloadMessageChat!
  
  public func update(messages: [(key: String, value: [CODMessage])]){
    
    //MARK: - Update message chat
    if let chatControllers = self.controllers as? ChatControllers {
      //1 - Get parameters for url
      self.downloadMessageChat   = DownloadMessageChat(controllers: chatControllers)
      let timeString = String(Int(chatControllers.vc.chatTable.messages.first?.value.first?.time ?? 0))
      let chatID     = chatControllers.vc.chatID ?? ""
      let data       = (time: timeString, chatID: chatID)
      //2 - Get message
      self.getMessage(data: data) { (newMessages) in
        //3 - Upload message
        self.downloadMessageChat.upload(lessThanMessage: newMessages)
      }
    }
    //MARK: - Update message chanel
    if let newsControllers = self.controllers as? NewsControllers {
      //1 - Get parameters for url
      self.downloadMessageNews = DownloadMessageNews(controllers: newsControllers)
      let timeString = String(Int(newsControllers.vc.newsTable.messages.first?.value.first?.time ?? 0))
      let chatID     = newsControllers.vc.chatID ?? ""
      let data       = (time: timeString, chatID: chatID)
      //2 - Get message
      self.getMessage(data: data) { (newMessages) in
        //3 - Upload message
        self.downloadMessageNews.upload(lessThanMessage: newMessages)
      }
    }
  }
  public func getMessage(data: (time: String, chatID: String), completion: @escaping Clousure<[CODMessage]>){
    //Request
    self.server.request(requestType: .GETEarlyMessages, data: data) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: DownloadEarlyMessages ->, function: getEarlyMessage -> data: [CODMessage] ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getMessage(data: data, completion: completion)
        }
        //Susses
        case .object(let object):
          let messages  = object as! [CODMessage]
          completion(messages)
          print("Succesful data: class: DownloadEarlyMessages ->, function: getEarlyMessage ->, data: [CODMessage]")
        
      }
    }
  }
  init(controllers: Controllers) {
    self.controllers = controllers
  }
}
