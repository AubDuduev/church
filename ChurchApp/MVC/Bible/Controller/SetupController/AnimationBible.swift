//
//  AnimationBible.swift
//  ChurchApp

import Foundation

class AnimationBible: Controller {
  
  //MARK: - Public variable
  public var VC: BibleViewController!
  
  
}
//MARK: - Initial
extension AnimationBible{
  
  //MARK: - Inition
  convenience init(viewController: BibleViewController) {
    self.init()
    self.VC = viewController
  }
}

