//
//  ErrorHandlerPrice.swift
//  ChurchApp
//
//  Created by Senior Developer on 20.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ErrorHandlerPrice {
   
  public func check(price: DECPrice?) -> Bool {
    do {
      try self.error(price: price)
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
  private func error(price: DECPrice?) throws  {
    
    //Ошибка получения
    guard let _ = price else { throw HandlerError.Nil }
    
    //Ошибки не обнаружены
    throw HandlerError.Succes
  }
  
  private enum HandlerError: String, Error {
    
    case Nil    = "Ошибка получения цен"
    case Empty  = "Получен , но пустой"
    case Succes
  }
}


