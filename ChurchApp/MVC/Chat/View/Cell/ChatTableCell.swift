//
//  ChatTableCell.swift
//  ChurchApp
import UIKit

class ChatTableCell: UITableViewCell, LoadNidoble {
  
  //MARK: - Outlets
  @IBOutlet weak var cornerRadiusMessageView: UIView!
  @IBOutlet weak var commonMessageView      : UIView!
  @IBOutlet weak var buttonsStackView       : UIStackView!
  @IBOutlet weak var messageTextView        : UITextView!
  @IBOutlet weak var messageLabel           : UILabel!
  @IBOutlet weak var nameUserLabel          : UILabel!
  @IBOutlet weak var nameUserView           : UIView!
  @IBOutlet weak var messageImageView       : UIImageView!
  @IBOutlet weak var avatarImageView        : UIImageView!
  @IBOutlet weak var fonAvatarView          : UIView!
  @IBOutlet weak var selfAvatarImageView    : UIImageView!
  @IBOutlet weak var selfFonAvatarView      : UIView!
  
  public var controllers       : ChatControllers!
  public var message           : CODMessage?
  public let customMarkdown    = CustomMarkdown()
  public let server            = Server()
  public var recipient         : Recipient = .from
  
  //MARK: - Outlets constarints
  @IBOutlet weak var buttonStackViewHeightConstant: NSLayoutConstraint!
  @IBOutlet weak var imageMessageHeightConstant   : NSLayoutConstraint!
  @IBOutlet weak var messageHeightConstant        : NSLayoutConstraint!
  @IBOutlet weak var messageLidingConstant        : NSLayoutConstraint!
  @IBOutlet weak var messageTralingConstant       : NSLayoutConstraint!
  @IBOutlet weak var nameUserLabelHeightConstant  : NSLayoutConstraint!
  
  //MARK: - Configure self cell
  public func configure(controllers: Controllers?, message: CODMessage?){
    self.setControllers(controllers: controllers)
    self.message = message
    self.controllers.logic.choiceRecepient(cell: self)
    self.controllers.present.setText(cell: self, text: message?.text)
    self.controllers.present.setNameUser(cell: self)
    self.controllers.present.setAvatar(cell: self, avatarURL: message?.userData?.avatar)
    self.controllers.present.setImage(cell: self, imageStringUrl: message?.image)
    self.controllers.setup.choiceFromMessage(cell: self)
    self.controllers.setup.setupTypeCell(cell: self, text: message?.text, image: message?.image)
  }
  private func setControllers(controllers: Controllers?){
    let controllers = controllers as! ChatControllers
    self.controllers = controllers
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    // self.controllers.setup.prepareForReuse(cell: self)
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    self.controllers?.setup.setupAvatar(cell: self)
    self.controllers?.setup.setupMessageView(cell: self)
  }
  @IBAction func presentFullPhotoButton(button: UIButton){
    self.controllers.router.push(.FullPhoto(self.messageImageView?.image))
  }
}
