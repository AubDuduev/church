//
//  AnimationChat.swift
//  ChurchApp
import UIKit

class AnimationChat: Controller {
  
  //MARK: - Public variable
  public var VC: ChatViewController!
  
  public func viewWillLayoutSubviews(){
   
  }
  public func viewDidDisappear() {
    self.animationLoadingView(show: true)
  }
  public func animationLoadingView(show: Bool){
    UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
      if show {
        self.VC.loadingView.alpha = 1
      } else {
        self.VC.loadingView.alpha = 0
      }
    })
  }
  public func heightSendMessageView(height: CGFloat){
    UIView.animate(withDuration: 0.3) {
      self.VC.sendMessageHeightConstant.constant = (height)
      self.VC.view.layoutIfNeeded()
    }
  }
  @objc
  public func animationSendView(notification: Notification?, show: Bool){
    guard let userInfo = notification?.userInfo else { return }
    guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
    UIView.animate(withDuration: 0.5) {
      if show {
        self.VC.commonStackBottomConstant.constant = (keyboardFrame.height - self.VC.view.safeAreaInsets.bottom)
      } else {
        self.VC.commonStackBottomConstant.constant = 25
      }
      self.VC.view.layoutIfNeeded()
    }
  }
}
//MARK: - Initial
extension AnimationChat{
  
  //MARK: - Inition
  convenience init(viewController: ChatViewController) {
    self.init()
    self.VC = viewController
  }
}

