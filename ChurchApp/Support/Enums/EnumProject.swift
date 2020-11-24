
//  Created by Senior Developer on 26.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import UIKit

enum TitlesChat: String, CaseIterable {
  
  case mainChanel          = "Основной канал"
  case mainChat            = "💎 DG BET Chat"
  case trialChanel         = "⏳ Тариф \"Триал\""
  case victorySeriasChanel = "💰 Тариф \"Серия Побед\""
  case reviewsStatistics   = "📊 Отзывы и статистика"
  case marafonChanel       = "📈 Марафон. 450 тысяч за 40 дней"
}

enum AliasesChat: String, CaseIterable {
  
  case mainChanel          = "main_channel"
  case mainChat            = "main_chat"
  case trialChanel         = "free_trial_3days"
  case victorySeriasChanel = "victory_series"
  case reviewsStatistics   = "reviews_n_statistics"
  case marafonChanel       = "maraphon"
  case dialog
  case none
}

enum AliasesPromotion: String, CaseIterable {
  
  case seriyaPobed      = "seriya_pobed_discount"
  case seriyaPobedMonth = "seriya_pobed_month_discount"
  case tarifTrial1      = "trial_1rub"
  case tarifTrial7      = "trial_7rub"
  case trial5001rub     = "trial_500_1rub"
  case none
}

enum TypeGetServerURLs {
 
  case developer
  case prodaction
}

enum RegexMessage: String, CaseIterable {
  case one  = #"(\[\[([^\]]+)\]\]\((https{0,1}:\/\/[^\)]+)\))"#
  case two  = #"\[\[([^\]]+)\]\]\{([^\}]+)\}"#
  case tree = #"\[\[([^\]]+)\]\]\((https{0,1}:\/\/[^\)]+)\)"#
  case fore = #"(\@[.]{0,11})|(\@[\D]{11})|(\@.{11})|(\@[\w]{11})|(\@...........)|(\@\bDiegoGarcia\b)"#
}
enum RegexButton: String, CaseIterable {
  case one  = #"\[\[([^\]]+)\]\]\{([^\}]+)\}"#
  case two = #"\[\[([^\]]+)\]\]\((https{0,1}:\/\/[^\)]+)\)"#//
}
enum PhoneNumbers: String {
  case hram = "+74956249772"
}

enum SendStaticMessage: String, CaseIterable {
  
  case sevenDay  = "Диего, привет! Хочу купить подписку: “Серия побед на 7 дней”"
  case days14    = "Диего, привет! Хочу купить подписку: “Серия побед на 14 дней”"
  case oneMont   = "Диего, привет! Хочу купить подписку: “Серия побед на 1 Месяц”"
  case oneYear   = "Диего, привет! Хочу купить подписку: “Серия побед на 1 год”"
  case promotion = "Диего, привет! Хочу купить подписку: “Тариф Триал”"
}

enum WebContentType {
  
  case html
  case web(String?)
  case file
}

enum ServicesLogicPushVC {
  case webViewPolicy
  case webViewSerialVictory
  case chatDiego
  case chanelReviews
}
enum PrilendPushVC {
  case webview
  case chat
  case chanel
  case tabBar
}
enum PinnedMessagePushVC {
  case chat
  case webview
}

enum ProjectButtonType: String {
  
  case check    = "Чек об оплате"
  case pay      = "pay_button"
  case info
  case book     = "button_bookmaker"
  case like     = "empty_button"
  case inst     = "instruction"
  case obuch    = "obuchenie"
  case chatOpen = "open_chat"
}

enum PrilendButtonType: String, CaseIterable {
  
  case readState  = "Читать статью"
  case learnState = "Как работает стратегия"
  case openChat   = "Открыть чат"
  case getBonus   = "Получить бонус"
}

enum PromotionDataType {
  
  case backend
  case local
}

enum EventNameType: String, CaseIterable {
  
  case sevenDay = "event__pay__victories_series_7days"
  case day14    = "event__pay__victories_series_14days"
  case oneMonth = "event__pay__victories_series_month"
  case oneYear  = "event__pay__victories_series_year"
}
enum AmountInt: Int, CaseIterable {
  
  case days7   = 1990
  case days14  = 3500
  case month   = 5500
  case oneYear = 19900
}
enum Amount: String, CaseIterable {
  
  case days7 = "250"
}
enum AmountString: String, CaseIterable {
  
  case days7   = "1990"
  case days14  = "3500"
  case month   = "5500"
  case oneYear = "19900"
}

enum ChatType {
  
  case diego
  case common
}

enum Recipient {
  case to
  case from
}

enum IDPurchaseProduct: String, CaseIterable {
  
  case EventPayVictoriesSeries7days
  case EventPayVictoriesSeries14days
  case EventPayVictoriesSeriesMonth
  case EventPayVictoriesSeriesYear
}

enum ServiceType: String {
  
  case products
  case healthNote    = "health_note"
  case restNote      = "rest_note"
  case prayerService = "prayer_service"
  case donate
  case proskomidiya
  case sorokoust
  case psaltir
}

enum RecurrentType: String, CaseIterable {
  
  case OneDay      = "1 day"   //1
  case FortyDays   = "40 days" //2
  case OneWeak     = "1 week"  //3
  case TwoWeak     = "2 weeks" //4
  case OneMonths   = "1 month" //5
  case ThreeMonths = "3 months"//6
  case SixMonths   = "6 months"//7
  case OneYear     = "1 year"  //8
  case non         = "Нет"
  
  static func getType(name: String?) -> Self {
    guard let name = name else { return .non }
    guard let type = LengthDaysRus(rawValue: name) else { return .non }
    switch type {
      case .OneDay:
        return .OneDay
      case .FortyDays:
        return .FortyDays
      case .OneWeak:
        return .OneWeak
      case .TwoWeak:
        return .TwoWeak
      case .OneMonths:
        return .OneMonths
      case .ThreeMonths:
        return .ThreeMonths
      case .SixMonths:
        return .SixMonths
      case .OneYear:
        return .OneYear
      case .non:
        return .non
    }
  }
}
enum LengthDaysRus: String, CaseIterable {
  
  case OneDay      = "1 день"     //1
  case FortyDays   = "40 дней"    //2
  case OneWeak     = "1 неделя"   //3
  case TwoWeak     = "2 недели"   //4
  case OneMonths   = "1 месяц"    //5
  case ThreeMonths = "3 месяца"   //6
  case SixMonths   = "6 месяцев"  //7
  case OneYear     = "12 месяцев" //8
  case non         = "Нет"
  
  static func getType(name: String?) -> Self {
    guard let name = name else { return .non }
    guard let type = RecurrentType(rawValue: name) else { return .non }
    switch type {
      case .OneDay:
        return .OneDay
      case .FortyDays:
        return .FortyDays
      case .OneWeak:
        return .OneWeak
      case .TwoWeak:
        return .TwoWeak
      case .OneMonths:
        return .OneMonths
      case .ThreeMonths:
        return .ThreeMonths
      case .SixMonths:
        return .SixMonths
      case .OneYear:
        return .OneYear
      case .non:
        return .non
    }
  }
}
enum AbautPreview: String, CaseIterable {
  
  case aboutOne
  case aboutTwo
  case aboutThree
  
  static func image(indexPath: IndexPath) -> UIImage? {
    return UIImage(named: AbautPreview.allCases[indexPath.row].rawValue)
  }
}

enum ViewParentStartScreen {
  
  case OtherVC
  case LoadingVC
}

enum BibleTestament: String, CaseIterable {
  
  case New = "Новый Завет"
  case Old = "Ветхий Завет"
 
}

enum TranslateBible: String, CaseIterable {
  
  case content  = "content"
  case contentC = "content_c"
  case contentG = "content_g"
  case contentI = "content_i"
  case contentL = "content_l"
  
  public func translate() -> String {
    switch self {
     
      case .content:
        return "Синодальный"
      case .contentC:
        return "Церковно-славянский"
      case .contentG:
        return "Греческий"
      case .contentI:
        return "Иврит"
      case .contentL:
        return "Латинский"
    }
  }
}

enum WorshipType {
  
  case stream
  case program
}

enum VideoSize {
  
  case square
  case araund
  case none
  
  static func videoSize(messageURL: String?) -> Self {
    guard let videoURL = messageURL else { return .araund }
    guard videoURL.contains("square") else { return .araund }
    return .square
  }
}
