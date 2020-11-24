//
//  RouterMakeDonation.swift
//  ChurchApp
import UIKit

class RouterMakeDonation: Controller {
  
  //MARK: - Public variable
  public var VC: MakeDonationViewController!
  
  public func push(_ type: Push){
    
    switch type {
      case .PopOver:
        self.pushPopOver()
      case .WebContent(let activeUrl):
        self.pushWebContent(activeUrl: activeUrl)
    }
  }
  
  enum Push {
    case PopOver
    case WebContent(String?)
  }
}
//MARK: - Private functions
extension RouterMakeDonation {
  
  private func pushPopOver(){
    let popOverVC = self.VC.getVCForID(storyboardID     : .PopOver,
                                       vcID             : .PopOverVC,
                                       transitionStyle  : .crossDissolve,
                                       presentationStyle: .popover) as! PopOverViewController
    popOverVC.popoverPresentationController?.delegate   = self.VC
    popOverVC.popoverPresentationController?.sourceView = self.VC.infoDonationButton
    let sourceRectX = self.VC.infoDonationButton.bounds.midX - 20
    let sourceRectY = self.VC.infoDonationButton.bounds.midY + 0
    popOverVC.popoverPresentationController?.sourceRect = CGRect(x: sourceRectX, y: sourceRectY, width: 0, height: 0)
    popOverVC.preferredContentSize = CGSize(width: 280, height: 200)
    
    self.VC.present(popOverVC, animated: true)
  }
  private func pushWebContent(activeUrl: String?){
    let webContentVC = self.VC.getVCForID(storyboardID     : .WebContent,
                                          vcID             : .WebContentVC,
                                          transitionStyle  : .crossDissolve,
                                          presentationStyle: .fullScreen) as! WebContentViewController
    webContentVC.activeUrl = activeUrl
    self.VC.present(webContentVC, animated: true)
  }
  
}
//MARK: - Initial
extension RouterMakeDonation{
  
  //MARK: - Inition
  convenience init(viewController: MakeDonationViewController) {
    self.init()
    self.VC = viewController
  }
}

