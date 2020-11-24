//
//  AnimationStart.swift
//  ChurchApp
import UIKit

class AnimationStart: Controller {
  
  //MARK: - Public variable
  public var VC: StartViewController!
  
  public func animationPage(){
    UIView.animate(withDuration          : 0.3,
                   delay                 : 0,
                   usingSpringWithDamping: 0.6,
                   initialSpringVelocity : 1.0,
                   options: .curveEaseInOut,
                   animations: {
      
    }, completion: { finish in
    
    })
      
    }
    
}
//MARK: - Initial
extension AnimationStart{
  
  //MARK: - Inition
  convenience init(viewController: StartViewController) {
    self.init()
    self.VC = viewController
  }
}

