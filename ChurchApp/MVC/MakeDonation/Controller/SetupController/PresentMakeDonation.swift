//
//  PresentMakeDonation.swift
//  ChurchApp

import Foundation

class PresentMakeDonation: Controller {
  
  //MARK: - Public variable
  public var VC: MakeDonationViewController!
  
  public func viewDidLoad() {
    self.recurrentDonation()
  }
  
  
  public func recurrentDonation(){
    if !GVuserData.isRecurrentDonation {
      self.VC.recurrentButton.setImage(nil, for: .normal)
      self.VC.recurrentButton.backgroundColor = .white
    } else {
      self.VC.recurrentButton.setImage(#imageLiteral(resourceName: "checkMakeDonation.pdf"), for: .normal)
      self.VC.recurrentButton.backgroundColor = .set(.buttonYellow)
    }
  }
}
//MARK: - Initial
extension PresentMakeDonation{
  
  //MARK: - Inition
  convenience init(viewController: MakeDonationViewController) {
    self.init()
    self.VC = viewController
  }
}

