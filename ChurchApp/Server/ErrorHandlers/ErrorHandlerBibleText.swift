//
//  ErrorHandlerBibleText.swift
//  ChurchApp
//
//  Created by Senior Developer on 05.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ErrorHandlerBibleText {
   
  public func check(bibleText: DECBibleText?) -> Bool {
    do {
      try self.error(bibleText: bibleText)
    } catch HandlerError.Succes {
      return true
    } catch HandlerError.Nil {
      AlertEK.customText(title: .error, message: .message(HandlerError.Nil.rawValue))
      return false
    } catch HandlerError.VersesEmpty {
      AlertEK.customText(title: .error, message: .message(HandlerError.VersesEmpty.rawValue))
      return false
    }catch HandlerError.ChaptersEmpty {
      AlertEK.customText(title: .error, message: .message(HandlerError.ChaptersEmpty.rawValue))
      return false
    } catch {
      AlertEK.dеfault(title: .error, message: .errorUnknown)
      return false
    }
    return false
  }
  private func error(bibleText: DECBibleText?) throws  {
    
    //Ошибка получения
    guard let bibleText = bibleText else { throw HandlerError.Nil }
    
    //Сообщения получены , но их нет
    if let verses = bibleText.verses, verses.isEmpty  {
      throw HandlerError.VersesEmpty
    }
    //Сообщения получены , но их нет
    if let chapters = bibleText.chapters, chapters.isEmpty  {
      throw HandlerError.ChaptersEmpty
    }
    
    //Ошибки не обнаружены
    throw HandlerError.Succes
  }
  
  private enum HandlerError: String, Error {
    
    case Nil           = "Ошибка получения текста"
    case VersesEmpty   = "Verses , но пустой"
    case ChaptersEmpty = "Chapters , но пустой"
    case Succes
  }
}


