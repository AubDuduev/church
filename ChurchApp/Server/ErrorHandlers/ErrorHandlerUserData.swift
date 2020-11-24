//
//  ErrorHandlerUserData.swift
//  ChurchApp
//
//  Created by Senior Developer on 12.08.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ErrorHandlerUserData {
   
  public func check(userData: CODUserData?) -> Bool {
    do {
      try self.error(userData: userData)
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
  private func error(userData: CODUserData?) throws  {
    
    //Ошибка получения
    guard let userData = userData else { throw HandlerError.Nil }
    
    guard userData.firstName != nil else { throw HandlerError.Empty }
    
    //Ошибки не обнаружены
    throw HandlerError.Succes
  }
  
  private enum HandlerError: String, Error {
    
    case Nil    = "Ошибка получения данных"
    case Empty  = "Получен , но пустой"
    case Succes
  }
}


