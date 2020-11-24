//
//  LogicChatCell.swift
//  ChurchApp
//
//  Created by Senior Developer on 24.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

extension LogicChat {
  
  public func choiceRecepient(cell: ChatTableCell){
    guard let userID = cell.message?.userData?.ID else { return }
    if String(userID) == GVuserData.userID {
      cell.recipient = .to
    } else {
      cell.recipient = .from
    }
  }
}
