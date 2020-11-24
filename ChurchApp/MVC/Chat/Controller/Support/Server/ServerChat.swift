//
//  ServerChat.swift
//  ChurchApp

import Foundation

class ServerChat: Controller {
  
  //MARK: - Public variable
  public var VC: ChatViewController!
  
  public func getChatsList(completion: @escaping Clousure<[DECChat]>){
    //Request
    self.VC.server.request(requestType: .GETChatList) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          print("Error server data: class: ServerChat ->, function: getChatList -> data: DECChatList->, description: ", error!.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getChatsList(completion: completion)
        }
        //Susses
        case .object(let object):
          let chatList = object as! [DECChat]
          completion(chatList)
          print("Succesful data: class: ServerChat ->, function: getChatList ->, data: DECChatList")
        
      }
    }
  }
  public func getMessages(chatID: String ,completion: @escaping Clousure<[CODMessage]>){
    //Request
    self.VC.server.request(requestType: .GETMessages, data: chatID) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          print("Error server data: class: ServerChat ->, function: getMessage -> data: DECMessage ->, description: ", error!.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getMessages(chatID: chatID, completion: completion)
        }
        //Susses
        case .object(let object):
          let messages = object as! [CODMessage]
          completion(messages)
          print("Succesful data: class: ServerChat ->, function: getMessage ->, data: DECMessage")
        
      }
    }
  }
  
}
//MARK: - Initial
extension ServerChat{
  
  //MARK: - Inition
  convenience init(viewController: ChatViewController) {
    self.init()
    self.VC = viewController
  }
}

