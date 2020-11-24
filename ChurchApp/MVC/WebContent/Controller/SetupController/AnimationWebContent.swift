//
//  AnimationWebContent.swift
//  ChurchApp

import Foundation

class AnimationWebContent: Controller {
  
  //MARK: - Public variable
  public var VC: WebContentViewController!
  
  
}
//MARK: - Initial
extension AnimationWebContent{
  
  //MARK: - Inition
  convenience init(viewController: WebContentViewController) {
    self.init()
    self.VC = viewController
  }
}

