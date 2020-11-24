//
//  SetupMakeDonation.swift
//  ChurchApp

import Foundation

class SetupMakeDonation: Controller {
  
  //MARK: - Public variable
  public var VC: MakeDonationViewController!
  
  public func viewDidLoad() {
    self.commonView()
    self.cornerRadiusView()
    self.textFieldsViews()
    self.changeDaysView()
    self.makeDonationView()
    self.chekmarkButton()
    self.delegates()
  }
}
//MARK: - Private functions
extension SetupMakeDonation {
  
  private func delegates(){
    self.VC.nameTextField.delegate =  self.VC
    self.VC.summTextField.delegate =  self.VC
  }
  private func commonView(){
    self.VC.commonView.cornerRadius(20, false)
    self.VC.commonView.shadowColor(color: .black, radius: 5)
  }
  private func cornerRadiusView(){
    self.VC.cornerRadiusView.cornerRadius(20, true)
  }
  private func textFieldsViews(){
    self.VC.textFieldsViews.forEach{ $0.cornerRadius(7, true)}
  }
  private func changeDaysView(){
    self.VC.changeDaysView.cornerRadius(5, true)
  }
  private func makeDonationView(){
    self.VC.makeDonationView.cornerRadius(5, true)
  }
  private func chekmarkButton(){
    self.VC.chekmarkButton.cornerRadius(5, true)
  }
}
//MARK: - Initial
extension SetupMakeDonation{
  
  //MARK: - Inition
  convenience init(viewController: MakeDonationViewController) {
    self.init()
    self.VC = viewController
  }
}

