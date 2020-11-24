//
//  SetupDonations.swift
//  ChurchApp

import UIKit

class SetupDonations: Controller {
  
  //MARK: - Public variable
  public var VC: DonationsViewController!
  
  public func viewDidLoad() {
    self.navBarView()
    self.animationControllCard()
    self.descriptionView()
    self.donationsButton()
  }
  public func viewWillAppear() {
  
  }
  public func viewDidAppear() {
    
  }
  public func viewDidLayoutSubviews() {
    self.progressDonationView()
  }
}
//MARK: - Private functions
extension SetupDonations {
  
  private func navBarView(){
    self.VC.navBarView.shadowColor(color: .black, radius: 5)
  }
  private func animationControllCard(){
    let cardHandle = (self.VC.view.bounds.height + 30) - self.VC.descriptionView.frame.minY
    self.VC.animationControllCard = AnimationControllCard(mainView   : self.VC.view,
                                                          animateView: self.VC.descriptionView,
                                                          cardHandle : cardHandle)
  }
  private func descriptionView(){
    self.VC.descriptionView.cornerRadius(15, false)
    self.VC.descriptionView.shadowColor(color: .black, radius: 5)
  }
  private func progressDonationView(){
    let corner = self.VC.progressDonationView.bounds.height / 2
    self.VC.progressDonationView.cornerRadius(corner, false)
    self.VC.progressDonationView.shadowColor(color: .black, radius: 5)
    self.VC.progressChartView.frame = CGRect(x: 0, y: 0, width: 205, height: 205)
    self.VC.progressDonationView.addSubview(self.VC.progressChartView)
  }
  private func donationsButton(){
    self.VC.donationsButton.cornerRadius(5, false)
  }
  
}
//MARK: - Initial
extension SetupDonations{
  
  //MARK: - Inition
  convenience init(viewController: DonationsViewController) {
    self.init()
    self.VC = viewController
  }
}

