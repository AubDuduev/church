//
//  AnimationEditText.swift
//  ChurchApp

import Foundation

class AnimationEditText: Controller {
  
  //MARK: - Public variable
  public var VC: EditTextViewController!
  
  
}
//MARK: - Initial
extension AnimationEditText{
  
  //MARK: - Inition
  convenience init(viewController: EditTextViewController) {
    self.init()
    self.VC = viewController
  }
}

