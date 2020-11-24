//
//  ErrorHandlersNews.swift
//  ChurchApp
//
//  Created by Senior Developer on 24.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ErrorHandlerWorships {
   
  public func check(worships: [DECWorship]?) -> Bool {
    do {
      try self.error(worships: worships)
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
  private func error(worships: [DECWorship]?) throws  {
    
    //1 - Ошибка получения
    guard let worships = worships else { throw HandlerError.Nil }
    
    //2 - Службы получены , но их нет
    if worships.isEmpty {
      throw HandlerError.Empty
    }
    
    //3 - Ошибки не обнаружены
    throw HandlerError.Succes
  }
  
  private enum HandlerError: String, Error {
    
    case Nil    = "Ошибка получения Служб"
    case Empty  = "Список полученых служб пустой"
    case Succes
  }
}


