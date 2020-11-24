//
//  ErrorHandlerOrders.swift
//  ChurchApp
//
//  Created by Senior Developer on 28.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ErrorHandlerOrders {
   
  public func check(orders: [DECOrder]?) -> Bool {
    do {
      try self.error(orders: orders)
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
  private func error(orders: [DECOrder]?) throws  {
    
    //Ошибка получения
    guard let orders = orders else { throw HandlerError.Nil }
    
    //Сообщения получены , но их нет
    if orders.isEmpty   {
      throw HandlerError.Empty
    }
    
    //Ошибки не обнаружены
    throw HandlerError.Succes
  }
  
  private enum HandlerError: String, Error {
    
    case Nil    = "Ошибка получения заказов"
    case Empty  = "Заказы получен , но список пустой"
    case Succes
  }
}


