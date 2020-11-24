//
//  LogicPrayerText.swift
//  ChurchApp
import UIKit
import Foundation

class LogicPrayerText: Controller {
  
  //MARK: - Public variable
  public var VC: PrayerTextViewController!
  
  public func setupEditText(editText: GDEditText){
   
    self.VC.contentTextView.font            = editText.font
    self.VC.contentTextView.backgroundColor = editText.colorBG
    self.VC.contentTextView.textColor       = editText.colorText
    self.VC.textViewView.backgroundColor    = editText.colorBG
  }
  public func share(){
    let controller = UIActivityViewController(activityItems: ["Поделись с друзями"], applicationActivities: nil)
    self.VC.present(controller, animated: true, completion: nil)
  }
}
//MARK: - Initial
extension LogicPrayerText{
  
  //MARK: - Inition
  convenience init(viewController: PrayerTextViewController) {
    self.init()
    self.VC = viewController
  }
}

