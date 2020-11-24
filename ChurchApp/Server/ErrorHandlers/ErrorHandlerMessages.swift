//
//  ErrorHandlerMessages.swift
//  DgBetTrip
//
//  Created by Senior Developer on 12.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class ErrorHandlerMessages {
   
  public func check(messages: [CODMessage]?, aliase: AliasesChat = .none) -> Bool {
    do {
      try self.typeError(messages: messages, aliase: aliase)
    } catch GetMessagesError.Succes {
      return true
    } catch GetMessagesError.MessagesNil {
      AlertEK.customText(title: .error, message: .message(GetMessagesError.MessagesNil.rawValue))
      return false
    } catch GetMessagesError.MessagesEmpty {
      AlertEK.customText(title: .error, message: .message(GetMessagesError.MessagesEmpty.rawValue))
      return false
    } catch GetMessagesError.MessagesTrialEmpty {
      AlertEK.customText(title: .error, message: .message(GetMessagesError.MessagesTrialEmpty.rawValue))
      return false
    } catch {
      AlertEK.dеfault(title: .error, message: .errorUnknown)
      return false
    }
  return false
  }
  private func typeError(messages: [CODMessage]?, aliase: AliasesChat = .none) throws  {
    
    //Ошибка получение сообщений
    guard let messages = messages else { throw GetMessagesError.MessagesNil }
    
    //Ошибка сообщения получены , но их нет
    if messages.isEmpty && aliase == .trialChanel  {
      throw GetMessagesError.MessagesTrialEmpty
    }
    //Ошибка сообщения получены , но их нет
    if messages.isEmpty {
      throw GetMessagesError.MessagesEmpty
    }
    
    //Ошибки не обнаружены
    throw GetMessagesError.Succes
  }
  
  enum GetMessagesError: String, Error {
    
    case MessagesNil        = "Ошибка получения сообщений"
    case MessagesEmpty      = "Ошибка, в этом чате еще нет сообщений"
    case MessagesTrialEmpty = "В этот чате нет сообщение, ожидание ..."
    case Succes
  }
}
