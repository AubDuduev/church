//
//  GDEditText.swift
//  ChurchApp
//
//  Created by Senior Developer on 10.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit
import Foundation

struct GDEditText {
  
  let colorBG  : UIColor!
  let colorText: UIColor!
  let font     : UIFont!
  
  enum FontTypeText: String {
    
    case Georgia
    case Display = "SFUIDisplay-Regular"
    
    public func font(size: CGFloat) -> UIFont? {
      return UIFont.set(self.rawValue, size)
    }
  }
  enum ColorTypeText: String {
    
    case White
    case Broun
    case Gray
    case Black
    
    public func color() -> UIColor? {
      return UIColor.set(self.rawValue)
    }
  }

  enum BGColorTypeText: String  {
    
    case WhiteBG
    case BrounBG
    case GrayBG
    case BlackBG
    
    public func color() -> UIColor? {
      return UIColor.set(self.rawValue)
    }
  }

  
  init(colorBG : BGColorTypeText, colorText: ColorTypeText, font: FontTypeText, fontSize : CGFloat) {
    
    self.colorBG   = colorBG.color()
    self.colorText = colorText.color()
    self.font      = font.font(size: fontSize)
  }
}
