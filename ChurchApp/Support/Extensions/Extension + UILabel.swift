//
//  Extension + CGFloat.swift
//  DG.BET
//
//  Created by -=ALEKSANDR=- on 01/September/2019.
//  Copyright © 2019 -=ALEKSANDR=-. All rights reserved.
//
import UIKit

extension UILabel {
  
  public func heightText(plus: CGFloat) -> CGFloat {
    let width : CGFloat = 200
    let height: CGFloat = 200
    let size = CGSize(width: width, height: height)
    let atributes  = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
    let options    = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
    guard let text = self.text else { return 0}
    let heightView = text.boundingRect(with: size,
                                       options: options,
                                       attributes: atributes,
                                       context: nil).height
    return heightView + plus
  }
}
