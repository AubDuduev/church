//
//  ChoosePSData.swift
//  ChurchApp
//
//  Created by Senior Developer on 30.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

struct ChoosePSData {
  
  let type: ChoosePSType!
  
  enum ChoosePSType: CaseIterable {
    
    case Icon
    case Saint
  }
}

enum Icons: String, CaseIterable {
  
  case one   = "Черниговская икона Божией Матери"
  case two   = "Святитель Николай Мирликийский Чудотворец"
  case three = "Голгофа"
  case fore  = "Преподобный Сергий Радонежский"
  case five  = "Преподобный Серафим Саровский"
  case six   = "Великомученик и целитель Пантелеимон"
  case seven = "Священномученик Петр Подкопаевский"
  case eight = "Святая блаженная Матрона Московская"
  case nine  = "Благоверная великая княгиня Ефросиния Московская"

}
enum Saints: String, CaseIterable {
  
  case one       = "Иисус Христос"
  case two       = "Божия Матерь"
  case three     = "Святитель Николай Мирликийский Чудотворец"
  case fore      = "Преподобный Сергий Радонежский"
  case five      = "Преподобный Серафим Саровский"
  case six       = "Великомученик и целитель Пантелеимон"
  case seven     = "Священномученик Петр Подкопаевский"
  case eight     = "Святая блаженная Матрона Московская"
  case nine      = "Благоверная великая княгиня Ефросиния Московская"
  case ten       = "Святая блаженная Ксения Петербургская"
  case twelvу    = "Блаженный Алексей человек Божий"
  case eleven    = "Великомученик Георгий Победоносец"
  case twelve    = "Великомученица Екатерина"
  case thirteen  = "Святитель Петр Московский"
  case fourteen  = "Архангел Михаил"
  case fifteen   = "Святитель Спиридон Тримифунтский"
  case sixteen   = "Святая мученица Параскева-Пятница"
  case seventeen = "Святитель Лука Войно-Ясенецкий"
  case eighteen  = "40-Севастийским мученика"
  case nineteen  = "Праведный воин Федор Ушаков"
  case tweуlve   = "Преподобный Даниил Московский"
  case thirуteen = "Великомученик Феодор Стратилат"
  
}
