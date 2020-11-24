//
//  DownloadMessageChat.swift
//  DgBetTrip
//
//  Created by Developer on 30.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class DownloadMessageChat {
  
  private let controllers: ChatControllers!
  
  public func upload(lessThanMessage: [CODMessage]){

    var arrayMessages = [CODMessage]()
    
    //MARK: - Update message chat
    let saveID = controllers.vc.chatTable.messages.first?.value.first?.ID ?? 0
    for (_, value) in controllers.vc.chatTable.messages {
      arrayMessages.append(contentsOf: value)
    }
    arrayMessages.append(contentsOf: lessThanMessage)
    controllers.vc.chatTable.messages = arrayMessages.sortedForDate()
    controllers.vc.chatTable.tableView.reloadData()
    controllers.vc.chatTable.tableView.scrollToRow(at:  self.getIndexPath(id: saveID), at: .top, animated: false)
    
  }
  private func getIndexPath(id: Int) -> IndexPath {
    //get section index
    for (section, data) in controllers.vc.chatTable.messages.enumerated() {
      //get row index
      for (row, message) in data.value.enumerated() {
        let ID = message.ID ?? 0
        if (ID == id){
          return IndexPath(row: row, section: section)
        }
      }
    }
    return IndexPath(row: 0, section: 0)
  }
  init(controllers: ChatControllers) {
    self.controllers =  controllers
  }
}
