//
//  ErrorHandlerServices.swift
//  ChurchApp
//
//  Created by Senior Developer on 04.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ErrorHandlerServices {
   
  public func check(services: [DECService]?) -> Bool {
    do {
      try self.error(services: services)
    } catch HandlerError.Succes {
      return true
    } catch HandlerError.Nil {
      AlertEK.customText(title: .error, message: .message(HandlerError.Nil.rawValue))
      return false
    } catch HandlerError.Empty {
      AlertEK.customText(title: .error, message: .message(HandlerError.Empty.rawValue))
      return false
    } catch {
      AlertEK.dеfault(title: .error, message: .errorUnknown)
      return false
    }
  return false
  }
  private func error(services: [DECService]?) throws  {
    
    //Ошибка получения
    guard let services = services else { throw HandlerError.Nil }
    
    //Сообщения получены , но их нет
    if services.isEmpty {
      throw HandlerError.Empty
    }
    
    //Ошибки не обнаружены
    throw HandlerError.Succes
  }
  
  private enum HandlerError: String, Error {
    
    case Nil    = "Ошибка получения служб"
    case Empty  = "Получен список служб, но пустой"
    case Succes
  }
}


