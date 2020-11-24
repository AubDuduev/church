//
//  RouterDonations.swift
//  ChurchApp
import Foundation

class RouterDonations: Controller {
  
  //MARK: - Public variable
  public var VC: DonationsViewController!
  
  public func push(_ type: Push){
    
    switch type {
      case .pushMakeDonation:
        self.pushMakeDonation()
      
    }
  }
  
  enum Push {
    case pushMakeDonation
  }
}
//MARK: - Private functions
extension RouterDonations {
  
  private func pushMakeDonation(){
    let VC = self.VC.getVCForID(storyboardID     : .MakeDonation,
                                vcID             : .MakeDonationVC,
                                transitionStyle  : .coverVertical,
                                presentationStyle: .overCurrentContext) as! MakeDonationViewController
    self.VC.present(VC, animated: true)
  }
}
//MARK: - Initial
extension RouterDonations{
  
  //MARK: - Inition
  convenience init(viewController: DonationsViewController) {
    self.init()
    self.VC = viewController
  }
}

