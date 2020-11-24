//
//  PresentChatCell.swift
//  ChurchApp
//
//  Created by Senior Developer on 24.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit
import SDWebImage

extension PresentChat {
  
  public func setText(cell: ChatTableCell, text: String?){
    let parser = MKParser(textMessage: text, boldColor: .set(.messageText), italicColor: .set(.messageText), textColor: .set(.messageText), textSize: 16)
    let changeText = self.VC.customMarkdown.parse(parser: parser)
    cell.messageTextView.attributedText = changeText
    cell.messageLabel.attributedText    = changeText
  }
  public func setNameUser(cell: ChatTableCell){
    cell.nameUserLabel.text = cell.message?.userData?.firstName
  }
  public func setImage(cell: ChatTableCell, imageStringUrl: String?){
    cell.messageImageView.image = nil
    guard let imageStringUrl = imageStringUrl else { return }
    let imageURL = cell.server.urls.get(type: .store(imageStringUrl)).URL
    cell.messageImageView.sd_setImage(with: imageURL) { (_, error, _, _) in
      cell.messageImageView.hideSkeleton()
    }
  }
  public func setAvatar(cell: ChatTableCell, avatarURL: String?){
    guard let avatarURL = avatarURL, avatarURL != "" else { return }
    cell.avatarImageView.showAnimatedGradientSkeleton()
    cell.selfAvatarImageView.showAnimatedGradientSkeleton()
    let imageURL = cell.server.urls.get(type: .store(avatarURL)).URL
    switch cell.recipient {
      //Self user message setup
      case .to:
       cell.selfAvatarImageView.sd_setImage(with: imageURL) { (_, error, _, _) in
         cell.selfAvatarImageView.hideSkeleton()
       }
      //Other user message setup
      case .from:
       cell.avatarImageView.sd_setImage(with: imageURL) { (_, error, _, _) in
         cell.avatarImageView.hideSkeleton()
       }
    }
  }
}
