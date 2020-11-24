//
//  SetupWebContent.swift
//  ChurchApp

import Foundation

class SetupWebContent: Controller {
  
  //MARK: - Public variable
  public var VC: WebContentViewController!
  
  public func viewDidLoad() {
    self.webView()
  }
}
//MARK: - Private functions
extension SetupWebContent {
  
  public func webView(){
    self.VC.webView.navigationDelegate = self.VC
    self.VC.webView.uiDelegate         = self.VC
  }
}
//MARK: - Initial
extension SetupWebContent{
  
  //MARK: - Inition
  convenience init(viewController: WebContentViewController) {
    self.init()
    self.VC = viewController
  }
}

