//
//  NewsViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class NewsViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: NewsControllers!
  
  //MARK: - Public variable
  public let server                  = Server()
  public let errorHandlerMessages    = ErrorHandlerMessages()
  public let errorHandlerGetLIstChat = ErrorHandlerGetLIstChat()
  public var aliasChat               : AliasesChat = .mainChanel
  public let scrollButtonView        = ScrollTableButtonView().loadNib()
  public let unreadNewMessageView    = UnreadNewMessageView().loadNib()
  public var updateChatMessages      : MessagesChatUpdate!
  public var chatID                  : String!
  public var currentChanel           : DECChat!
  public var downloadEarlyMessages   : DownloadEarlyMessages!
  public let customMarkdown          = CustomMarkdown()
  public var callBackDismiss         : ClousureEmpty!
  
  //MARK: - Outlets
  @IBOutlet weak var newsTable: NewsTable!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.controllers.logic.viewWillAppear()
  }
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    self.controllers.logic.viewDidDisappear()
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.controllers.logic.viewWillDisappear()
  }
  private func setControllers(){
    self.controllers = NewsControllers(viewController: self)
  }
}
