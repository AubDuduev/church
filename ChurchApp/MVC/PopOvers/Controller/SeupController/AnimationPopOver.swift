//
//  AnimationPopOver.swift
//  ChurchApp

import Foundation

class AnimationPopOver: Controller {
  
  //MARK: - Public variable
  public var VC: PopOverViewController!
  
  
}
//MARK: - Initial
extension AnimationPopOver{
  
  //MARK: - Inition
  convenience init(viewController: PopOverViewController) {
    self.init()
    self.VC = viewController
  }
}

