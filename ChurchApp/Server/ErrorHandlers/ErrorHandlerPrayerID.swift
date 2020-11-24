//
//  ErrorHandlerPrays.swift
//  ChurchApp
//
//  Created by Senior Developer on 09.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ErrorHandlerPrayerID {
   
  public func check(prayer: DECPrayer?) -> Bool {
    do {
      try self.error(prayer: prayer)
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
  private func error(prayer: DECPrayer?) throws  {
    
    //Ошибка получения
    guard let _ = prayer else { throw HandlerError.Nil }
  
    
    //Ошибки не обнаружены
    throw HandlerError.Succes
  }
  
  private enum HandlerError: String, Error {
    
    case Nil    = "Ошибка получения"
    case Empty  = "Получен, но пустой"
    case Succes
  }
}


