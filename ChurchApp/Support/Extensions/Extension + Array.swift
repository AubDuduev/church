//
//  Extension + DecChatList.swift
//  DgBetTrip
//
//  Created by Senior Developer on 26.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

extension Array where Iterator.Element == DECChat {
  
  func chatForAlias(_ aliasChanel: AliasesChat) -> DECChat? {
    
    let chat = self.filter {
      guard $0.alias != nil else { return false }
      return $0.alias!.lowercased().contains(aliasChanel.rawValue.lowercased())
    }
  return chat.first
  }
  func deleteChat(_ aliasChanel: AliasesChat) -> [DECChat] {
    
    let chats = self.filter {
      guard $0.alias != nil else { return false }
      return !$0.alias!.lowercased().contains(aliasChanel.rawValue.lowercased())
    }
  return chats
  }
}

extension Array where Iterator.Element == CODMessage {
  
  func sortedForDate() -> [(key: String, value: [CODMessage])] {
    var messagesDictionary = [String: [CODMessage]]()
    let dateFormat         = DateFormatter()
    dateFormat.dateFormat = "MMMM d, yyyy"
    let messages = self.sorted{ $0.time! < $1.time! }
    for message in messages {
      //get message time
      if let time = message.time {
        //create dictionary
        if var array = messagesDictionary.updateValue([message], forKey: time.format(.long)) {
          array.append(message)
          messagesDictionary.updateValue(array, forKey: time.format(.long))
        }
      }
    }
  return messagesDictionary.sorted { dateFormat.date(from: $0.key)! < dateFormat.date(from: $1.key)!}
  }
}
extension Array where Iterator.Element == DECPromotion {
  
  func getSortedFirst() -> DECPromotion? {
    let sorted = self.sorted {
      if let one = $0.duration, let two = $1.duration {
        return one > two
      }
    return false
    }
  return sorted.first
  }
  func compareAliase(alias: AliasesPromotion?) -> Bool {
    if (getSortedFirst()?.aliase ?? "") == (alias?.rawValue ?? "noAliase") {
      print(getSortedFirst()?.aliase as Any, "one aliase")
      print(alias?.rawValue as Any, "two alias")
      return true
    } else {
      return false
    }
  }
}
extension Array {
  
  func compare(_ index: Int) -> Bool {
    if (self.count == index) {
      return false
    }
  return true
  }
}

extension Array where Iterator.Element == DECWorship {
  
  func sortedDate() -> [DECWorship] {
    
    return self.sorted{ ($0.date ?? 0) > ($1.date ?? 0)}
  }
}
extension Array where Iterator.Element == GDWorship {
  
  func sortedDate() -> [GDWorship] {
    
    return self.sorted{ ($0.date ?? 0) > ($1.date ?? 0)}
  }
}
extension Array where Iterator.Element == DECBible {
  
  func testament( _ type: BibleTestament) -> DECBible? {
    return self.filter{ $0.name == type.rawValue }.first
  }
}
