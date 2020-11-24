//
//  UpdateChatMessages.swift
//  DgBetTrip
//
//  Created by Developer on 26.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import Foundation

class MessagesChatUpdate {
  
  private var updatetoble: MessagesChatUpdatoble!
  
  public func getNewMessage(){
    SocketManager.shared.newMessage = { messages in
      guard self.updatetoble.messages != nil else { return }
      guard let messages = messages else { return }
      //add new message
      var lastTyple = self.updatetoble.messages.removeLast()
      messages.forEach{ lastTyple.value.append($0)}
      self.updatetoble.messages.append(lastTyple)
      
      //update tableview
      self.updateNewMessage()
      //проверяем в каком месте смотрит пользователь сообщения
      self.checkIsScrollingTable(messages: messages)
    }
  }
  private func updateNewMessage(){
    let sections   = self.updatetoble.messages.count - 1
    let rows       = self.updatetoble.messages.last!.value.count - 1
    let indexPaths = [IndexPath(row: rows, section: sections)]
    self.updatetoble.tableView.beginUpdates()
    self.updatetoble.tableView.insertRows(at: indexPaths, with: .automatic)
    self.updatetoble.tableView.endUpdates()
  }
  private func checkIsScrollingTable(messages: [CODMessage]){
    
    if self.updatetoble.tableView.isBottom(to: 100), let controllers = self.updatetoble.controllers as? ChatControllers {
      controllers.vc.unreadNewMessageView.countUnreadMessage += messages.count
      controllers.vc.unreadNewMessageView.set()
      return
    } else if let controllers = self.updatetoble.controllers as? ChatControllers {
      self.updatetoble.tableView.scrollTo(.bottom)
      controllers.vc.unreadNewMessageView.set()
    }
    if self.updatetoble.tableView.isBottom(to: 100), let controllers = self.updatetoble.controllers as? NewsControllers {
      controllers.vc.unreadNewMessageView.countUnreadMessage += messages.count
      controllers.vc.unreadNewMessageView.set()
      return
    } else if let controllers = self.updatetoble.controllers as? NewsControllers {
      self.updatetoble.tableView.scrollTo(.bottom)
      controllers.vc.unreadNewMessageView.set()
    }
  }
  public func deleteMessage(){
    SocketManager.shared.deleteMessage = { (messages, ID) in
      let indexPaths = [self.getIndexPathMessage(messageID: ID)]
      var removeTuples = self.updatetoble.messages.remove(at: indexPaths.first!.section)
      removeTuples.value.remove(at: indexPaths.first!.row)
      self.updatetoble.messages.insert(removeTuples, at: indexPaths.first!.section)
      self.updatetoble.tableView.beginUpdates()
      self.updatetoble.tableView.deleteRows(at: indexPaths, with: .automatic)
      self.updatetoble.tableView.endUpdates()
    }
  }
  private func getIndexPathMessage(messageID: Int) -> IndexPath {
    //get section fixed message
    for (section, data) in self.updatetoble.messages.enumerated() {
        //get row fixed message
        for (row, message) in data.value.enumerated() {
          let messageId = message.ID ?? 0
          if (messageId == messageID){
            return IndexPath(row: row, section: section)
          }
        }
      }
  return IndexPath(row: 0, section: 0)
  }
  
  init(updatetoble: MessagesChatUpdatoble) {
    self.updatetoble = updatetoble
  }
}
