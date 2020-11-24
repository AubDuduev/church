//
//  RouterPrayerText.swift
//  ChurchApp
import UIKit
import Foundation

class RouterPrayerText: Controller {
  
  //MARK: - Public variable
  public var VC: PrayerTextViewController!
  
  public func push(_ type: Push){
    
    switch type {
      case .EditText:
        self.pushEditText()
    }
  }
  
  enum Push {
    case EditText
  }
}
//MARK: - Private functions
extension RouterPrayerText {
  
  private func pushEditText(){
    let editTextVC = self.VC.getVCForID(storyboardID     : .EditText,
                                        vcID             : .EditTextVC,
                                        transitionStyle  : .crossDissolve,
                                        presentationStyle: .popover) as! EditTextViewController
    editTextVC.popoverPresentationController?.delegate   = self.VC
    editTextVC.popoverPresentationController?.sourceView = self.VC.editTextButton
    let sourceRectX = self.VC.editTextButton.bounds.midX
    let sourceRectY = self.VC.editTextButton.bounds.midY + 10
    editTextVC.popoverPresentationController?.permittedArrowDirections = .up
    editTextVC.popoverPresentationController?.sourceRect = CGRect(x: sourceRectX, y: sourceRectY, width: 0, height: 0)
    editTextVC.preferredContentSize = CGSize(width: 250, height: 270)
    editTextVC.editTextColback = { [weak self] (editText) in
      self?.VC.controllers.logic.setupEditText(editText: editText)
    }
    self.VC.present(editTextVC, animated: true)
  }
}
//MARK: - Initial
extension RouterPrayerText{
  
  //MARK: - Inition
  convenience init(viewController: PrayerTextViewController) {
    self.init()
    self.VC = viewController
  }
}

