//
//  LogicChat.swift
//  ChurchApp
import UIKit

class LogicChat: Controller {
  
  //MARK: - Public variable
  public var VC: ChatViewController!
  
  public func viewWillAppear() {
    self.getChatListForAliase()
  }
  public func viewDidDisappear() {
    self.clouseSocket()
    self.pauseAllCellsVideo()
  }
  //Логика размера SendMessageView при вводе сообщения
  public func heighSendMesageView(){
    //1 -  Вычисляем высоту
    let text     = self.VC.sendMessageTextView.text ?? ""
    let widthMax = self.VC.sendMessageTextView.frame.width
    let width : CGFloat = widthMax
    let height: CGFloat = 100
    //parameters
    let size       = CGSize(width: width, height: height)
    let atributes  = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
    let options    = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
    let heightView = text.boundingRect(with      : size,
                                       options   : options,
                                       attributes: atributes,
                                       context   : nil).height + 52
    //2 - Анимированно меняем
    self.VC.controllers.animation.heightSendMessageView(height: heightView)
  }
  //MARK: - Common logic chanel view controller
  public func getChatListForAliase(){
    //1 - Получаем список всех чатов на сервере
    self.VC.controllers.server.getChatsList { (chatList) in
      //2 - Обрабатываем ошибки
      guard self.VC.errorHandlerGetLIstChat.check(chatsList: chatList, aliasesChat: self.VC.aliasChat) else { return }
      //4 - Получаем нужный чат
      let chat = chatList.chatForAlias(self.VC.aliasChat)!
      self.VC.currentChat = chat
      //5 - Определяем тип чата
      self.choiceChatType(chat: chat)
      //6 - Получаем ID чата
      let chatID = self.getChatID(chat: chat)
      self.VC.chatID = chatID
      //7 - Подключаемся по Сокет к чату
      self.VC.controllers.setup.setupSocket(chatID: chatID)
      //8 - Получаем сообщения чата
      SocketManager.shared.get()
      SocketManager.shared.allMessage = { (messages) in
        //12 - Обрабатываем ошибки сообщений
        guard self.VC.errorHandlerMessages.check(messages: messages, aliase: self.VC.aliasChat) else { return }
        //13 - Представляем сообщение в ячейку
        self.VC.controllers.present.setMessagesChatTableCell(messages: messages!)
        //14 - Убираем загрузку
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          
        }
      }
      //15 - Подписываемся на появление новых сообщений
      self.VC.updateChatMessages.getNewMessage()
      //16 - Подписываемся на удаление сообщений
      self.VC.updateChatMessages.deleteMessage()
    }
  }
  //метод сипользуется таблицей при скроле
  public func showScrollTableButtonView(show: Bool){
    self.VC.scrollButtonView.animation(show: show)
    //Убираем вью с количеством сообщений если наш скрол внизу
    if !self.VC.chatTable.tableView.isBottom(to: 100){
      self.VC.unreadNewMessageView.countUnreadMessage = 0
      self.VC.unreadNewMessageView.set()
    }
  self.VC.sendMessageTextView.resignFirstResponder()
  }
  public func sendPhoto(){
//    let sendPhotoVC = self.VC.getVC(storyboardID: .SendPhoto,
//                                    animation: true,
//                                    transitionStyle: .crossDissolve,
//                                    presentationStyle: .currentContext) as! SendPhotoViewController
//    self.VC.present(sendPhotoVC, animated: true)
  }
  public func sendMessage(){
    guard self.VC.sendMessageTextView.checkSendMessage() else { return }
    let userData = CODUserData()
    let message  = CODMessage(text: self.VC.sendMessageTextView.text,
                             time: Date().timeIntervalSince1970,
                             userData: userData)
    SocketManager.shared.send(message: message)
    self.VC.sendMessageTextView.text = ""
  }
  public func updateEarlyMessage(scrol: UIScrollView, messages: [(key: String, value: [CODMessage])]){
    guard scrol.isTop(to: 0) else { return }
    self.VC.downloadEarlyMessages.update(messages: messages)
  }
}
//MARK: - Private functions
extension LogicChat {
  
  private func getChatID(chat: DECChat) -> String {
    return String(chat.id ?? 0)
  }
  private func clouseSocket(){
    SocketManager.shared.clouse()
  }
  private func choiceChatType(chat: DECChat){
    let title = chat.title ?? ""
    self.VC.chatType = title.contains("Diego") ? .diego: .common
  }
  private func pauseAllCellsVideo(){
    let videoCell = self.VC.chatTable.tableView?.visibleCells.filter{ $0 is VideoTableViewCell } as! [VideoTableViewCell]
    videoCell.forEach { $0.pauseVideo() }
  }
  public func pauseIfPlayOtherVideo(cell: VideoTableViewCell){
    let videoCell = self.VC.chatTable.tableView?.visibleCells.filter { $0 is VideoTableViewCell } as! [VideoTableViewCell]
    videoCell.forEach {
      if cell != $0 {
        $0.pauseVideo()
      }
    }
  }
}
//MARK: - Initial
extension LogicChat {
  
  //MARK: - Inition
  convenience init(viewController: ChatViewController) {
    self.init()
    self.VC = viewController
  }
}
