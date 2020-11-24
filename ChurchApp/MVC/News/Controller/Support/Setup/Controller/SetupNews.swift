//
//  SetupNews.swift
//  ChurchApp

import Foundation

class SetupNews: Controller {
  
  //MARK: - Public variable
  public var VC: NewsViewController!
  
  public func viewDidLoad() {
    self.newsTable()
    self.downloadEarlyMessages()
    self.updateChatMessages()
  }
  public func setupSocket(chatID: String){
    SocketManager.shared.connect(chatID: chatID)
  }
}
//MARK: - Private functions
extension SetupNews {
  
  public func newsTable(){
    self.VC.newsTable.controllers = self.VC.controllers
  }
  private func updateChatMessages(){
    self.VC.updateChatMessages = MessagesChatUpdate(updatetoble: self.VC.newsTable)
  }
  private func downloadEarlyMessages(){
    self.VC.downloadEarlyMessages = DownloadEarlyMessages(controllers: self.VC.controllers)
  }
}
//MARK: - Initial
extension SetupNews{
  
  //MARK: - Inition
  convenience init(viewController: NewsViewController) {
    self.init()
    self.VC = viewController
  }
}

