//
//  ErrorHandlerDonations.swift
//  ChurchApp
//
//  Created by Senior Developer on 05.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ErrorHandlerDonations {
   
  public func check(donations: DECDonations?) -> Bool {
    do {
      try self.error(donations: donations)
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
  private func error(donations: DECDonations?) throws  {
    
    //Ошибка получения
    guard let _ = donations else { throw HandlerError.Nil }
    
    //Ошибки не обнаружены
    throw HandlerError.Succes
  }
  
  private enum HandlerError: String, Error {
    
    case Nil    = "Ошибка получения данных донната"
    case Empty  = "Получен , но пустой"
    case Succes
  }
}


