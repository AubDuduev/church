//
//  ErrorHandlerProducts.swift
//  ChurchApp
//
//  Created by Senior Developer on 01.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ErrorHandlerProducts {
   
  public func check(products: [DECProduct]?, controller: BakeryControllers?) -> Bool {
    do {
      try self.error(products: products)
    } catch HandlerError.Succes {
      return true
    } catch HandlerError.Nil {
      AlertEK.customText(title: .error, message: .message(HandlerError.Nil.rawValue)){
        controller?.vc.dismiss(animated: true)
      }
      return false
    } catch HandlerError.Empty {
      AlertEK.customText(title: .error, message: .message(HandlerError.Empty.rawValue)){
        controller?.vc.dismiss(animated: true)
      }
      return false
    } catch {
      AlertEK.dеfault(title: .error, message: .errorUnknown)
      return false
    }
  return false
  }
  private func error(products: [DECProduct]?) throws  {
    
    //Ошибка получения
    guard let products = products else { throw HandlerError.Nil }
    
    //Сообщения получены , но их нет
    if products.isEmpty {
      throw HandlerError.Empty
    }
    
    //Ошибки не обнаружены
    throw HandlerError.Succes
  }
  
  private enum HandlerError: String, Error {
    
    case Nil    = "Ошибка получения Продуктов"
    case Empty  = "Cписок полученых продуктов пустой"
    case Succes
  }
}


