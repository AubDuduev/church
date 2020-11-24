//
//  SetupNewsCell.swift
//  ChurchApp
//
//  Created by Senior Developer on 23.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import SDWebImage
import UIKit

extension SetupNews {
  
  public func setupTypeCell(text: String?, image: String?, cell: NewTableCell){
   print(self.changeTypeCell(text: text, image: image, cell: cell))
    switch self.changeTypeCell(text: text, image: image, cell: cell) {
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
          cell.messageTextLabel.text                  = nil
          cell.messageTextView.text                   = nil
      }
  }
  
  public func commonViewCell(_ cell: NewTableCell){
    cell.commonView.cornerRadius(7, true)
    cell.commonView.shadowColor(color: .lightGray, radius: 2, sizeW: 0, sizeH: 0)
    cell.cornerRadiusView.cornerRadius(7, true)
  }
  
  public func imageMessageCell(_ cell: NewTableCell){
     cell.imageMessageView.cornerRadius(6, true)
     cell.messageImageView.cornerRadius(6, true)
  }
  public func avatarCell(_ cell: NewTableCell){
    cell.avatarView.cornerRadius(21, true)
    cell.avatarView.shadowColor(color: .lightGray, radius: 5)
    cell.avatarImageView.cornerRadius(21, true)
  }
  public func messageViewCell(_ cell: NewTableCell){
    cell.cornerRadiusView.cornerRadius(7, true)
  }
  public func messageTextCell(_ cell: NewTableCell){
    cell.messageTextView.textColor  = .set(.messageText)
    cell.timeMessageLabel.textColor = .set(.timeMessageText)
    cell.userNameLabel.textColor    = .set(.messageText)
    cell.userNameTimeMessageView.backgroundColor = .clear
    cell.userNameLabel.backgroundColor           = .clear
    cell.timeMessageLabel.backgroundColor        = .clear
    cell.messageView.backgroundColor             = .white
    cell.messageTextLabel.backgroundColor        = .clear
  }
  public func prepareForReuse(cell: NewTableCell){
    cell.buttonsStackView.removeFromSuperview()
    self.setupTypeCell(text: nil, image: nil, cell: cell)
  }

}
//MARK: - Private functions
extension SetupNews {
  
  private func changeTypeCell(text: String?, image: String?, cell: NewTableCell) -> SetupNews.TypeCell {
    
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
  
  private func stackButtonHeight(cell: NewTableCell) -> CGFloat {
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
