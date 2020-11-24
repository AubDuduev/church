//
//  AnimationNews.swift
//  ChurchApp

import Foundation

class AnimationNews: Controller {
  
  //MARK: - Public variable
  public var VC: NewsViewController!
  
  
}
//MARK: - Initial
extension AnimationNews{
  
  //MARK: - Inition
  convenience init(viewController: NewsViewController) {
    self.init()
    self.VC = viewController
  }
}

