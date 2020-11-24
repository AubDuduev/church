//
//  SetupChatCell.swift
//  ChurchApp
//
//  Created by Senior Developer on 24.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import SDWebImage
import UIKit

extension SetupChat {
  
  public func setupTypeCell(cell: ChatTableCell, text: String?, image: String?){
    print(self.changeTypeCell(cell: cell, text: text, image: image))
    switch self.changeTypeCell(cell: cell, text: text, image: image) {
      //1-Кнопка без сообщений
      case .button:
        cell.buttonStackViewHeightConstant.constant = stackButtonHeight(cell: cell)
        cell.messageHeightConstant.constant         = 10
        cell.messageHeightConstant.priority         = .init(1000)
        cell.imageMessageHeightConstant.constant    = 0
      //2-Одно сообщение
      case .message:
        cell.imageMessageHeightConstant.constant    = 0
        cell.buttonStackViewHeightConstant.constant = 0
        cell.messageHeightConstant.priority         = .init(1)
      //3-Одна картинка
      case .image:
        cell.buttonStackViewHeightConstant.constant = 0
        cell.messageHeightConstant.constant         = 10
        cell.messageHeightConstant.priority         = .init(1000)
        cell.imageMessageHeightConstant.constant    = 270
      //4-Сообщение и картинка
      case .messageImage:
        cell.imageMessageHeightConstant.constant    = 270
        cell.buttonStackViewHeightConstant.constant = 0
        cell.messageHeightConstant.priority         = .init(1)
      //5-Кнопка и картинка
      case .buttonMessage:
        cell.imageMessageHeightConstant.constant    = 0
        cell.messageHeightConstant.priority         = .init(1)
        cell.buttonStackViewHeightConstant.constant = stackButtonHeight(cell: cell)
      //6-КНопка картинка и сообщение
      case .buttonMessageImage:
        cell.imageMessageHeightConstant.constant    = 270
        cell.messageHeightConstant.priority         = .init(1)
        cell.buttonStackViewHeightConstant.constant = stackButtonHeight(cell: cell)
      //7 - Пустое сообщение
      case .emptyMessage:
        cell.imageMessageHeightConstant.constant    = 0
        cell.messageHeightConstant.priority         = .init(1000)
        cell.messageHeightConstant.constant         = 20
        cell.buttonStackViewHeightConstant.constant = 0
        cell.messageImageView.image                 = nil
        cell.messageLabel.text                      = nil
        cell.messageTextView.text                   = nil
    }
  }
  public func setupAvatar(cell: ChatTableCell){
    cell.avatarImageView.cornerRadius(21.0, true)
    cell.fonAvatarView.cornerRadius(21.0, true)
    cell.fonAvatarView.shadowColor(color: .gray, radius: 1, sizeW: 0, sizeH: 0)
    cell.selfAvatarImageView.cornerRadius(21.0, true)
    cell.selfFonAvatarView.borderColor(#colorLiteral(red: 0.4598978162, green: 0.4599792957, blue: 0.4598870873, alpha: 1), 0.5)
    cell.selfFonAvatarView.cornerRadius(21.0, true)
    cell.selfFonAvatarView.shadowColor(color: .gray, radius: 1, sizeW: 0, sizeH: 0)
  }
  public func setupMessageView(cell: ChatTableCell){
    cell.cornerRadiusMessageView.cornerRadius(7, true)
    cell.commonMessageView.cornerRadius(7, true)
    cell.commonMessageView.shadowColor(color: .lightGray, radius: 2, sizeW: 0, sizeH: 0)
  }
  public func setupMessageText(cell: ChatTableCell){
    cell.messageTextView.textColor = .set(.messageText)
    cell.messageTextView.font      = UIFont.set( .DisplayRegular, 16)
  }
  public func prepareForReuse(cell: ChatTableCell){
    cell.buttonsStackView.removeFromSuperview()
    setupTypeCell(cell: cell, text: nil, image: nil)
  }
  public func choiceFromMessage(cell: ChatTableCell){
    
    switch cell.recipient {
      //Self user message setup
      case .to:
        cell.messageLidingConstant.constant       = 12
        cell.messageTralingConstant.constant      = 66
        cell.messageLabel.textAlignment           = .left
        cell.messageLabel.backgroundColor         = #colorLiteral(red: 0.9764705882, green: 0.968627451, blue: 0.9294117647, alpha: 1)
        cell.fonAvatarView.alpha                  = 0
        cell.nameUserLabel.textAlignment          = .left
        cell.nameUserLabelHeightConstant.constant = 15
        cell.nameUserView.isHidden                = false
        //avatar
        cell.fonAvatarView.alpha                  = 0
        cell.selfFonAvatarView.alpha              = 1
      //Other user message setup
      case .from:
        cell.messageLidingConstant.constant       = 66
        cell.messageTralingConstant.constant      = 12
        cell.messageLabel.textAlignment           = .left
        cell.messageLabel.backgroundColor         = .white
        cell.nameUserLabel.textAlignment          = .left
        cell.nameUserView.isHidden                = false
        cell.nameUserLabelHeightConstant.constant = 15
        //avatar
        cell.fonAvatarView.alpha                  = 1
        cell.selfFonAvatarView.alpha              = 0
    }
  }
  
  private func changeTypeCell(cell: ChatTableCell, text: String?, image: String?) -> SetupChat.TypeCell {
    
    switch true {
      //Одна кнопка
      case ((text == nil || text == "" || text == " " || text == "  ") && image == nil && !cell.buttonsStackView.arrangedSubviews.isEmpty):
        return .button
      //Одно сообщение
      case ((text != nil || text != "" || text != " " || text != "  ") && image == nil && cell.buttonsStackView.arrangedSubviews.isEmpty):
        return .message
      //Одна картинка
      case ((text == nil || text == "" || text == " " || text == "  ") && image != nil && cell.buttonsStackView.arrangedSubviews.isEmpty):
        return .image
      //Картинка и сообщение
      case ((text != nil || text != "" || text != " " || text != "  ") && image != nil && cell.buttonsStackView.arrangedSubviews.isEmpty):
        return .messageImage
      //Кнопка и сообщение
      case ((text != nil || text != "" || text != " " || text != "  ") && image == nil && !cell.buttonsStackView.arrangedSubviews.isEmpty):
        return .buttonMessage
      //Кнопка сообщение и картинка
      case ((text != nil || text != "" || text != " " || text != "  ") && image != nil && !cell.buttonsStackView.arrangedSubviews.isEmpty):
        return .buttonMessageImage
      //Пустое сообщение
      case ((text == nil || text == "" || text == " " || text == "  ") && image == nil && cell.buttonsStackView.arrangedSubviews.isEmpty):
        return .emptyMessage
      //Пустое сообщение
      default:
        return .emptyMessage
    }
  }
  private func stackButtonHeight(cell: ChatTableCell) -> CGFloat {
    let height = cell.buttonsStackView.arrangedSubviews.count * 45
    return CGFloat(height) + 60
  }
  
  enum TypeCell {
    
    case buttonMessageImage
    case buttonMessage
    case button
    case message
    case image
    case messageImage
    case emptyMessage
  }
}


