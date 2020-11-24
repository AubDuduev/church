//
//  SetupChat.swift
//  ChurchApp

import UIKit

class SetupChat: Controller {
  
  //MARK: - Public variable
  public var VC: ChatViewController!
  
  public func viewDidLoad(){
    self.chatTable()
    self.updateChatMessages()
    self.downloadEarlyMessages()
    self.setupNotification()
    self.sendMessageView()
    self.delegates()
    self.sendMessageTextInputView()
  }
  public func setupSocket(chatID: String){
    SocketManager.shared.connect(chatID: chatID)
  }
}
//MARK: - Private functions
extension SetupChat {
  
  private func delegates(){
    self.VC.sendMessageTextView.delegate = self.VC
  }
  private func sendMessageTextInputView(){
    self.VC.inputMessageView.cornerRadius(15, false)
  }
  private func chatTable(){
    self.VC.chatTable.controllers = self.VC.controllers
  }
  private func sendMessageView(){
    self.VC.sendMessageTextView.cornerRadius(20, true)
  }
  private func updateChatMessages(){
    self.VC.updateChatMessages = MessagesChatUpdate(updatetoble: self.VC.chatTable)
  }
  private func downloadEarlyMessages(){
    self.VC.downloadEarlyMessages = DownloadEarlyMessages(controllers: self.VC.controllers)
  }
  private func setupNotification(){
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil)
    {(notification) in
      self.VC.controllers.animation.animationSendView(notification: notification, show: true)
    }
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil)
    {(notification) in
      self.VC.controllers.animation.animationSendView(notification: notification, show: false)
    }
  }
}
//MARK: - Initial
extension SetupChat{
  
  //MARK: - Inition
  convenience init(viewController: ChatViewController) {
    self.init()
    self.VC = viewController
  }
}

