//
//  LogicNews.swift
//  ChurchApp
import UIKit

class LogicNews: Controller {
  
  //MARK: - Public variable
  public var VC: NewsViewController!
  
  public func viewWillAppear() {
    self.getChatListForAliase()
  }
  public func viewDidDisappear() {
    self.clouseSocket()
    self.pauseAllCellsVideo()
  }
  public func viewWillDisappear() {
    self.hideAlertEK()
  }
  //MARK: - Common logic chanel view controller
  public func getChatListForAliase(){
    //1 - Получаем список всех чатов на сервере
    self.VC.controllers.server.getChatsList { (chatList) in
      //2 - Обрабатываем ошибки
      guard self.VC.errorHandlerGetLIstChat.check(chatsList: chatList, aliasesChat: self.VC.aliasChat) else { return }
      //4 - Получаем нужный чат
      let chat = chatList.chatForAlias(self.VC.aliasChat)!
      self.VC.currentChanel = chat
      //6 - Получаем ID чата
      let chatID = self.getChatID(chat: chat)
      self.VC.chatID = chatID
      //7 - Подключаемся по Сокет к чату
      self.VC.controllers.setup.setupSocket(chatID: chatID)
      //8 - Получаем сообщения чата
      SocketManager.shared.get()
      SocketManager.shared.allMessage = { (messages) in
        //9 - Обрабатываем ошибки сообщений
        guard self.VC.errorHandlerMessages.check(messages: messages, aliase: self.VC.aliasChat) else { return }
        //10 - Представляем сообщение в ячейку
        self.VC.controllers.present.setMessagesTableCell(messages: messages!)
        //11 - Убираем загрузку
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
         
        }
      }
      //12 - Подписываемся на появление новых сообщений
      self.VC.updateChatMessages.getNewMessage()
      //13 - Подписываемся на удаление сообщений
      self.VC.updateChatMessages.deleteMessage()
      
    }
  }
  public func showScrollTableButtonView(show: Bool){
    self.VC.scrollButtonView.animation(show: show)
    //Убираем вью с количеством сообщений если наш скрол внизу
    if !self.VC.newsTable.tableView.isBottom(to: 100){
      self.VC.unreadNewMessageView.countUnreadMessage = 0
      self.VC.unreadNewMessageView.set()
    }
  }
  public func pauseIfPlayOtherVideo(cell: VideoTableViewCell){
    let videoCell = self.VC.newsTable.tableView?.visibleCells.filter { $0 is VideoTableViewCell } as! [VideoTableViewCell]
    videoCell.forEach {
      if cell != $0 {
        $0.pauseVideo()
      }
    }
  }
  public func updateEarlyMessage(scrol: UIScrollView, messages: [(key: String, value: [CODMessage])]?){
    guard let messages = messages else { return }
    guard scrol.isTop(to: 0) else { return }
    self.VC.downloadEarlyMessages.update(messages: messages)
  }
}
//MARK: - Private functions
extension LogicNews {
  
  private func getChatID(chat: DECChat) -> String {
    return String(chat.id ?? 0)
  }
  private func clouseSocket(){
    SocketManager.shared.clouse()
  }
  private func pauseAllCellsVideo(){
    let videoCell = self.VC.newsTable.tableView?.visibleCells.filter{ $0 is VideoTableViewCell } as! [VideoTableViewCell]
    videoCell.forEach { $0.pauseVideo() }
  }
  private func hideAlertEK(){
    AlertEK.hide()
  }
}
//MARK: - Initial
extension LogicNews {
  
  //MARK: - Inition
  convenience init(viewController: NewsViewController) {
    self.init()
    self.VC = viewController
  }
}

