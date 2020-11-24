//
//  SetupBakeryInfo.swift
//  ChurchApp

import Foundation

class SetupBakeryInfo: Controller {
  
  //MARK: - Public variable
  public var VC: BakeryInfoViewController!
  
  public func viewDidLoad() {
    self.buyButton()
    self.countButtonView()
    self.commonView()
    self.cornerRadiusView()
  }
}
//MARK: - Private functions
extension SetupBakeryInfo {
  
  private func countButtonView(){
    self.VC.countButtonView.cornerRadius(7, true)
    self.VC.countButtonView.borderColor(.lightGray, 1)
  }
  private func buyButton(){
    self.VC.buyButton.cornerRadius(7, true)
  }
  private func commonView(){
    self.VC.commonView.borderColor(.lightGray, 0.5)
    self.VC.commonView.cornerRadius(20, false)
    self.VC.commonView.shadowColor(color: .black, radius: 5)
  }
  private func cornerRadiusView(){
    self.VC.cornerRadiusView.cornerRadius(20, true)
  }
}
//MARK: - Initial
extension SetupBakeryInfo{
  
  //MARK: - Inition
  convenience init(viewController: BakeryInfoViewController) {
    self.init()
    self.VC = viewController
  }
}

