//
//  ErrorHandlerGetChatForAliase.swift
//  DgBetTrip
//
//  Created by Senior Developer on 05.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class ErrorHandlerGetChatForAliase {
  
  public func check(chatList: [DECChat]?, index: Int) -> AliasesChat? {
    do {
      let aliaseFirst = try self.typeError(chatList: chatList, index: index)
      return aliaseFirst
    } catch GetChatAliaseError.Succes {
      return nil
    } catch GetChatAliaseError.AliaseNil{
      AlertEK.customText(title: .error, message: .message(GetChatAliaseError.AliaseNil.rawValue))
      return nil
    } catch GetChatAliaseError.ChatNil{
      AlertEK.customText(title: .error, message: .message(GetChatAliaseError.ChatNil.rawValue))
      return nil
    } catch {
      AlertEK.dеfault(title: .error, message: .errorUnknown)
      return nil
    }
  }
  private func typeError(chatList: [DECChat]?, index: Int) throws -> AliasesChat  {
    
    //Ошибка чата
    guard let chatList = chatList else { throw GetChatAliaseError.ChatNil }
    
    //Ошибка получения алиаса из массива чатов по индексу
    guard let aliase = chatList[index].alias else {
      throw GetChatAliaseError.AliaseNil
    }
    
    //Ошибка получения элиаса по элиасу
    guard let aliaseFirst = AliasesChat.allCases.filter({ aliase.contains($0.rawValue) }).first else {
      throw GetChatAliaseError.AliaseNil
    }
  return aliaseFirst
  }
  
  enum GetChatAliaseError: String, Error {
    
    case ChatNil   = "Ошибка получения чатов"
    case AliaseNil = "Ошибка получения чата"
    case Succes
  }
}
