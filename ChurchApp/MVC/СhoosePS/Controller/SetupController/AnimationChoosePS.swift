//
//  AnimationChoosePS.swift
//  ChurchApp

import Foundation

class AnimationChoosePS: Controller {
  
  //MARK: - Public variable
  public var VC: ChoosePSViewController!
  
  
}
//MARK: - Initial
extension AnimationChoosePS{
  
  //MARK: - Inition
  convenience init(viewController: ChoosePSViewController) {
    self.init()
    self.VC = viewController
  }
}

