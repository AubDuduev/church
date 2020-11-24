//
//  ChatViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ChatViewController: UIViewController {
  
  //MARK: - Public variable
  public var controllers             : ChatControllers!
  public let server                  = Server()
  public let errorHandlerMessages    = ErrorHandlerMessages()
  public let errorHandlerGetLIstChat = ErrorHandlerGetLIstChat()
  public var aliasChat               : AliasesChat = .dialog
  public let scrollButtonView        = ScrollTableButtonView().loadNib()
  public let unreadNewMessageView    = UnreadNewMessageView().loadNib()
  public var updateChatMessages      : MessagesChatUpdate!
  public var chatType                = ChatType.diego
  public var chatID                  : String!
  public var currentChat             : DECChat!
  public var downloadEarlyMessages   : DownloadEarlyMessages!
  public let customMarkdown          = CustomMarkdown()
  public var callBackDismiss         : ClousureEmpty!
  
  //MARK: - Outlets -
  @IBOutlet weak var chatTitleLabel      : UILabel!
  @IBOutlet weak var chatTable           : ChatTable!
  @IBOutlet weak var sendMessageTextView : UITextView!
  @IBOutlet weak var inputMessageView    : UIView!
  @IBOutlet weak var sendMessageView     : UIView!
  @IBOutlet weak var loadingView         : UIView!
  @IBOutlet weak var sendPhotoButtonLabel: UIButton!
  @IBOutlet weak var avatarChatImageView : UIImageView!
  
  @IBOutlet weak var commonStackBottomConstant   : NSLayoutConstraint!
  @IBOutlet weak var sendMessageHeightConstant   : NSLayoutConstraint!
  @IBOutlet weak var sendPhotoButtonWidthConstant: NSLayoutConstraint!
  
  //MARK: - Outlets array
  @IBOutlet var loadMessageLabels: [UILabel]!
  @IBOutlet var loadAvatarViews  : [UIImageView]!
  
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
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    self.controllers.logic.viewDidDisappear()
  }
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
   
  }
  private func setControllers(){
    self.controllers = ChatControllers(viewController: self)
  }
}

