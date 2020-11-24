//
//  ErrorHandlerGetLIstChat.swift
//  DgBetTrip
//
//  Created by Senior Developer on 01.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class ErrorHandlerGetLIstChat {
   
  public func check(chatsList: [DECChat]?, aliasesChat: AliasesChat = .none) -> Bool {
    do {
      try self.typeErrorChat(chatsList: chatsList, aliasesChat: aliasesChat)
    } catch GetChatError.Succes {
      return true
    } catch GetChatError.ChatsListNil {
      AlertEK.customText(title: .error, message: .message(GetChatError.ChatsListNil.rawValue))
      return false
    } catch GetChatError.ChatsListEmpty {
      AlertEK.customText(title: .error, message: .message(GetChatError.ChatsListEmpty.rawValue))
      return false
    } catch GetChatError.GetChatError {
      AlertEK.customText(title: .error, message: .message(GetChatError.GetChatError.rawValue))
      return false
    } catch {
      AlertEK.dеfault(title: .error, message: .errorUnknown)
      return false
    }
  return false
  }
  public func checkChat(){
    
  }
  private func typeErrorChat(chatsList: [DECChat]?, aliasesChat: AliasesChat = .none) throws  {
    
    //Ошибка получение списка чатов
    guard let chatsList = chatsList else { throw GetChatError.ChatsListNil }
    
    //Ошибка чаты получены , но список пустой
    guard !chatsList.isEmpty else { throw GetChatError.ChatsListEmpty }
    
    if aliasesChat != .none {
      //Ошибка получение конкретного чата если нам нужен чат
      guard chatsList.chatForAlias(aliasesChat) != nil else { throw GetChatError.GetChatError }
    }
    
    //Ошибки не обнаружены
    throw GetChatError.Succes
  }
  
  enum GetChatError: String, Error {
    
    case ChatsListNil   = "Ошибка получения чатов"
    case ChatsListEmpty = "Ошибка, чаты пустые"
    case GetChatError   = "Ошибка получения чата"
    case Succes
  }
}
