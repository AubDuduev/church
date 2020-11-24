//
//  RouterBakery.swift
//  ChurchApp
import Foundation

class RouterBakery: Controller {
  
  //MARK: - Public variable
  public var VC: BakeryViewController!
  
  public func push(_ type: Push){
    
    switch type {
      case .BakeryInfo(let product):
        self.pushBakeryInfo(product: product)
      
    }
  }
  
  enum Push {
    case BakeryInfo(DECProduct?)
  }
}
//MARK: - Private functions
extension RouterBakery {
  
  private func pushBakeryInfo(product: DECProduct?){
    let bakeryInfoViewC = self.VC.getVCForID(storyboardID     : .BakeryInfo,
                                             vcID             : .BakeryInfoVC,
                                             transitionStyle  : .coverVertical,
                                             presentationStyle: .overCurrentContext) as! BakeryInfoViewController
    bakeryInfoViewC.product = product
    self.VC.present(bakeryInfoViewC, animated: true)
  }
}
//MARK: - Initial
extension RouterBakery{
  
  //MARK: - Inition
  convenience init(viewController: BakeryViewController) {
    self.init()
    self.VC = viewController
  }
}

