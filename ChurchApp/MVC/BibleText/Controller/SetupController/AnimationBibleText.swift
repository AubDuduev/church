//
//  AnimationBibleText.swift
//  ChurchApp

import Foundation

class AnimationBibleText: Controller {
  
  //MARK: - Public variable
  public var VC: BibleTextViewController!
  
  
}
//MARK: - Initial
extension AnimationBibleText{
  
  //MARK: - Inition
  convenience init(viewController: BibleTextViewController) {
    self.init()
    self.VC = viewController
  }
}

