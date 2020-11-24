//
//  AnimationNote.swift
//  ChurchApp

import UIKit

class AnimationNote: Controller {
  
  //MARK: - Public variable
  public var VC: NoteViewController!
  
  @objc
  public func animationCommon(notification: Notification?, show: Bool){
    guard let userInfo = notification?.userInfo else { return }
    guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
    UIView.animate(withDuration: 0.5) {
      if show {
        let transform = (keyboardFrame.height - self.VC.view.safeAreaInsets.bottom)
        self.VC.scrollContentView.contentSize.height = (self.VC.commonView.bounds.height + transform)
        self.VC.scrollContentView.bounces = false
      } else {
        self.VC.scrollContentView.contentSize.height = self.VC.commonView.bounds.height
      }
    }
  }
  
  public func deleteRow(cell: NoteTableCell, gesture: UISwipeGestureRecognizer){
    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
      if gesture.direction == .left {
        cell.textFieldView.transform = CGAffineTransform(translationX: -70, y: 0)
      } else {
        cell.textFieldView.transform = .identity
      }
    })
   
  }
}
//MARK: - Initial
extension AnimationNote{
  
  //MARK: - Inition
  convenience init(viewController: NoteViewController) {
    self.init()
    self.VC = viewController
  }
}

