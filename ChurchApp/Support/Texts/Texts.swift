//
//  TextsProject.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

class Texts {
  static func text(_ text: Project) -> String {
    return text.rawValue
  }
  enum Title: String, CaseIterable {
    
    case empty        = ""
    case error        = "ОШИБКА"
    case noNetwork    = "НЕТ ИНТЕРНЕТА"
    case noMessage    = "НЕТ СООБЩЕНИЙ"
    case sendEmail    = "ОТПРАВЛЕН"
    case save         = "Сохранен"
    case registration = "Регистрация"
    case information  = "Информация"
    case install      = "Установить"
    case success      = "Успешно"
    case addPhoto     = "Изменить фото"
    
    private func localizedString() -> String {
      return NSLocalizedString(self.rawValue, comment: "")
    }
    
    func getTextFor(title: Title?) -> String {
      return title!.localizedString()
    }
  }
  enum Message: String, CaseIterable {
    
    case empty                  = ""
    case noNetwork              = "Отсутствует подключение к сети, подключите Ваше устройство и попробуйте снова"
    case noJSON                 = "Извините произошла ошибка получения данных"
    case noMessage              = "У Вас нет не одного сообщения"
    case emptyField             = "Введите корректные данные и попробуйте снова"
    case sendEmail              = "Ваш email отправлен"
    case tryEnded               = "Количество попыток закончилось"
    case registrRequaer         = "Для этого действия требуется регистрация"
    case error                  = "Произошла ошибка попробуйте позже"
    case telegramm              = "Для участия в конкурсе необходимо подписаться на телеграм бота, Вам необходимо иметь учетную запись Телеграм"
    case errorUnknown           = "Не известная ошибка"
    case orderSucces            = "Записка создана перейти к оплате?"
    case errorTransactions      = "Ошибка с транзакцией"
    case successActiveSubscribe = "Подписка успешно оформлена"
    case addPhotoChange         = "Фото взять из библиотеки или сделать фотографию?"
    case userDataUpdateError    = "Ошибка обновления данных"
    case userDataUpdateSucces   = "Ваши данные обновлены"
    
    private func localizedString() -> String {
      return NSLocalizedString(self.rawValue, comment: "")
    }
    
    func getTextFor(message: Message?) -> String {
      return message!.localizedString()
    }
  }
  enum MessageCustom {
    case message(String)
  }
  enum Worning {
    case non
  }
  
  enum Project: String {
    
    case empty
    case createNote = "Отправить записку"
    
    private func localizedString() -> String {
      return NSLocalizedString(self.rawValue, comment: "")
    }
    func getTextFor(_ text: Project?) -> String {
      return text!.localizedString()
    }
  }
  enum StartPageText {
    case one
  }
  enum StartPageTitle {
    case one
  }
}
enum TextType {
  
  case Title
  case Message
  case Project
}
enum TextAlert: String, CaseIterable {
  
  case empty
  case noJSON
  case noNetwork
  case noSendedEmail
  case yesSendedEmail
  case inputEmail
  case emptyField
  case noMessage
  case sendEmail
  case tryEnded
  case saveLike
  case registrRequaer
  case changeTour
  
}
enum TextSimple {
  case some
}



