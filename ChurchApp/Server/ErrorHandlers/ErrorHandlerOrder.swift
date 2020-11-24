//
//  ErrorHandlerOrder.swift
//  ChurchApp
//
//  Created by Senior Developer on 18.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ErrorHandlerOrder {
   
  public func check(order: DECOrder?) -> Bool {
    do {
      try self.error(order: order)
    } catch HandlerError.Succes {
      return true
    } catch HandlerError.Nil {
      AlertEK.customText(title: .error, message: .message(HandlerError.Nil.rawValue))
      return false
    } catch HandlerError.Error {
      AlertEK.customText(title: .error, message: .message(order!.errors!))
      return false
    } catch {
      AlertEK.dеfault(title: .error, message: .errorUnknown)
      return false
    }
  return false
  }
  private func error(order: DECOrder?) throws  {
    
    //Ошибка создания казака
    guard let order = order else { throw HandlerError.Nil }
    
    //Ошибка
    if order.errors != nil {
      throw HandlerError.Error
    }
    //Ошибки не обнаружены
    throw HandlerError.Succes
  }
  
  private enum HandlerError: String, Error {
    
    case Nil    = "Ошибка получения заказа"
    case Error  = "Получен , но пустой"
    case Succes = "Заказ создан переидите к оплате"
  }
}


