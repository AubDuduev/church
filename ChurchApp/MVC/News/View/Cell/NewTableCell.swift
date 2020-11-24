//
//  NewTableCell.swift
//  ChurchApp
import UIKit

class NewTableCell: UITableViewCell, LoadNidoble {
  
  @IBOutlet weak var avatarView             : UIView!
  @IBOutlet weak var avatarImageView        : UIImageView!
  @IBOutlet weak var commonView             : UIView!
  @IBOutlet weak var cornerRadiusView       : UIView!
  @IBOutlet weak var buttonsStackView       : UIStackView!
  @IBOutlet weak var commonStackView        : UIStackView!
  @IBOutlet weak var userNameTimeMessageView: UIView!
  @IBOutlet weak var userNameLabel          : UILabel!
  @IBOutlet weak var timeMessageLabel       : UILabel!
  @IBOutlet weak var messageView            : UIView!
  @IBOutlet weak var messageTextLabel       : UILabel!
  @IBOutlet weak var messageTextView        : UITextView!
  @IBOutlet weak var imageMessageView       : UIView!
  @IBOutlet weak var messageImageView       : UIImageView!
  
  private var controllers: NewsControllers!
  
  //MARK: - Outlets constarints
  @IBOutlet weak var buttonStackViewHeightConstant: NSLayoutConstraint!
  @IBOutlet weak var imageMessageHeightConstant   : NSLayoutConstraint!
  @IBOutlet weak var messageHeightConstant        : NSLayoutConstraint!
  
  //MARK: - Configure self cell
  public func configure(controllers: NewsControllers?, message: CODMessage?){
    self.controllers = controllers
    self.controllers.present.setText(text: message?.text, cell: self)
    self.controllers.present.setImage(imageStringUrl: message?.image, cell: self)
    self.controllers.setup.setupTypeCell(text: message?.text, image: message?.image, cell: self)
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    self.controllers.setup.prepareForReuse(cell: self)
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    self.controllers?.setup.commonViewCell(self)
    self.controllers?.setup.avatarCell(self)
    self.controllers?.setup.messageTextCell(self)
    self.controllers?.setup.messageViewCell(self)
    self.controllers?.setup.imageMessageCell(self)
  }
  @IBAction func presentFullPhotoButton(button: UIButton){
    self.controllers.router.push(.FullPhoto(self.messageImageView?.image))
  }
}
