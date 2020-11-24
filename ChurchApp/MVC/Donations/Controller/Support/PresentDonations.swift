//
//  PresentDonations.swift
//  ChurchApp

import UIKit

class PresentDonations: Controller {
  
  //MARK: - Public variable
  public var VC: DonationsViewController!
  
  public func currentSum(donations: DECDonations?){
    self.VC.currentSumLabel.text = "\(donations?.currentSum ?? "") ₽"
  }
  public func currentSumProcent(procent: Int){
    self.VC.currentSumProcentLabel.text = "Уже собрали \(procent) % суммы на"
  }
  public func descriptionDonates(donations: DECDonations?){
    self.VC.descriptionTextView.text = donations?.description
  }
}
//MARK: - Initial
extension PresentDonations{
  
  //MARK: - Inition
  convenience init(viewController: DonationsViewController) {
    self.init()
    self.VC = viewController
  }
}

