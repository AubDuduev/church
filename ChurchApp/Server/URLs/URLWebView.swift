//
//  ChangeURLAfterOpen.swift
//  DgBetTrip
//
//  Created by Senior Developer on 02.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import Foundation

class URLWebView {
  
  enum Sources: String {
    
    case BooksFragment        //(экран букмекеров)
    case ServicesFragment     //(экран услуг)
    case StudyFragment        //(экраны обучения)
    case SpecialOfferFragment //(экран спецпредложения)
    case WinSeries            //(статья "Серия Побед")
    case StartToBet           //(статья "Как начать ставить?")
    case MainChanel           = "main_channel"
    case MainChat             = "main_chat"
    case Dialog               = "dialog"
    case TrialDays            = "free_trial_3days"
    case VictoryDays          = "victory_series"
    case Statistic            = "reviews_n_statistics"
    case Marafon              = "maraphon"
  }
}
