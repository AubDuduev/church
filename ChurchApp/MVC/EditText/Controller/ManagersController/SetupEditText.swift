//
//  SetupEditText.swift
//  ChurchApp
import UIKit
import Foundation

class SetupEditText: Controller {
  
  //MARK: - Public variable
  public var VC: EditTextViewController!
  
  public func viewDidLoad() {
    self.brightness()
    self.fontType()
    self.sizeTExt()
    self.colorText()
  }
}
//MARK: - Private functions
extension SetupEditText {
  
  public func brightness(){
    self.VC.brightnessSlider.value = Float(UIScreen.main.brightness)
  }
  public func sizeTExt(){
    self.VC.fontSize = 16
  }
  public func fontType(){
    self.VC.fontChekmarkButtons.forEach{ $0.tintColor = .clear }
    self.VC.fontChekmarkButtons[0].tintColor = .blue
  }
  public func colorText(){
    self.VC.colorImages.forEach{ $0.tintColor = .clear }
    self.VC.colorImages.first?.tintColor      = .black
    self.VC.colorImages[0].tintColor          = .blue
  }
}
//MARK: - Initial
extension SetupEditText{
  
  //MARK: - Inition
  convenience init(viewController: EditTextViewController) {
    self.init()
    self.VC = viewController
  }
}

