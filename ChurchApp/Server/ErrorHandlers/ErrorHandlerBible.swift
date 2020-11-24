//
//  ErrorHandlerBible.swift
//  ChurchApp
//
//  Created by Senior Developer on 04.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ErrorHandlerBible {
   
  public func check(bible: [DECBible]?) -> Bool {
    do {
      try self.error(bible: bible)
    } catch HandlerError.Succes {
      return true
    } catch HandlerError.Nil {
      AlertEK.customText(title: .error, message: .message(HandlerError.Nil.rawValue))
      return false
    } catch HandlerError.BibleEmpty {
      AlertEK.customText(title: .error, message: .message(HandlerError.BibleEmpty.rawValue))
      return false
    } catch HandlerError.StoragesEmpty {
      AlertEK.customText(title: .error, message: .message(HandlerError.StoragesEmpty.rawValue))
      return false
    } catch {
      AlertEK.dеfault(title: .error, message: .errorUnknown)
      return false
    }
  return false
  }
  private func error(bible: [DECBible]?) throws  {
    
    //Ошибка получения
    guard let bible = bible?.first else { throw HandlerError.Nil }
    
    //Сообщения получены , но их нет
    if let storages = bible.storages, storages.isEmpty {
      throw HandlerError.BibleEmpty
    }
    //Сообщения получены , но их нет
    if let books = bible.storages.first?.books, books.isEmpty {
      throw HandlerError.StoragesEmpty
    }
    
    //Ошибки не обнаружены
    throw HandlerError.Succes
  }
  
  private enum HandlerError: String, Error {
    
    case Nil           = "Ошибка получения библии"
    case BibleEmpty    = "Библия получена, но пустая"
    case StoragesEmpty = "Храненик получено, но пустая"
    case Succes
  }
}


