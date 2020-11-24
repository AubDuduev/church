//
//  LogicEditText.swift
//  ChurchApp
import UIKit
import Foundation

class LogicEditText: Controller {
  
  //MARK: - Public variable
  public var VC: EditTextViewController!
  
  public func brightness(value: Float){
    UIScreen.main.brightness = CGFloat(value)
  }
  public func sizeTExt(value: Float){
    self.VC.fontSize = CGFloat((value * 10) + 16)
    self.setupEditText()
  }
  public func fontType(tag: Int){
    switch tag {
      case 0:
        self.VC.fontTypeText = .Display
      case 1:
        self.VC.fontTypeText = .Georgia
      default:
        break
    }
    self.VC.fontChekmarkButtons.forEach{ $0.tintColor = .clear }
    self.VC.fontChekmarkButtons[tag].tintColor = .blue
    self.setupEditText()
  }
  public func colorText(button: UIButton){
    switch button.tag {
      case 0:
        self.VC.colorTypeText = .Black
        self.VC.colorBGText   = .BlackBG
      case 1:
        self.VC.colorTypeText = .Broun
        self.VC.colorBGText   = .BrounBG
      case 2:
        self.VC.colorTypeText = .Gray
        self.VC.colorBGText   = .GrayBG
      case 3:
        self.VC.colorTypeText = .White
        self.VC.colorBGText   = .WhiteBG
      default:
        break
    }
   
    self.VC.colorImages.forEach{ $0.tintColor = .clear }
    self.VC.colorImages.first?.tintColor      = .black
    self.VC.colorImages[button.tag].tintColor = .blue
    self.setupEditText()
  }
}
//MARK: - Private functions
extension LogicEditText {
  
  public func setupEditText(){
    
    let editText = GDEditText(colorBG  : self.VC.colorBGText,
                              colorText: self.VC.colorTypeText,
                              font     : self.VC.fontTypeText,
                              fontSize : self.VC.fontSize)
    GVeditText = editText
    self.VC.editTextColback?(GVeditText)
  }
}
//MARK: - Initial
extension LogicEditText{
  
  //MARK: - Inition
  convenience init(viewController: EditTextViewController) {
    self.init()
    self.VC = viewController
  }
}

