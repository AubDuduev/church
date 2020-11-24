//
//  PresentNewsCell.swift
//  ChurchApp
//
//  Created by Senior Developer on 24.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit
import SDWebImage
import SkeletonView

extension PresentNews {
  
  public func setText(text: String?, cell: NewTableCell){
    let parser = MKParser(textMessage: text)
    let changeText = self.VC.customMarkdown.parse(parser: parser)
    cell.messageTextView.attributedText  = changeText
    cell.messageTextLabel.attributedText = changeText
  }
  public func setImage(imageStringUrl: String?, cell: NewTableCell){
    guard let imageStringUrl = imageStringUrl else { return }
    let imageURL = self.VC.server.urls.get(type: .store(imageStringUrl)).URL
    cell.messageImageView.sd_setImage(with: imageURL) { (_, error, _, _) in
      cell.messageImageView.hideSkeleton()
    }
  }
}

