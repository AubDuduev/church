//
//  SetupPayNote.swift
//  ChurchApp

import Foundation

class SetupPayNote: Controller {
  
  //MARK: - Public variable
  public var VC: PayNoteViewController!
  
  public func viewDidLoad() {
    self.commonView()
    self.changeDaysView()
    self.makeDonationView()
    self.checkMarkButton()
    self.cornerRadiusView()
    self.buttonSvatIconViews()
    self.sorocoustTypeView()
    self.commentView()
    self.daysDonationButtons()
  }
}
//MARK: - Private functions
extension SetupPayNote {
  
  private func delegates(){
    
  }
  private func commonView(){
    self.VC.commonView.cornerRadius(10, false)
    self.VC.commonView.shadowColor(color: .black, radius: 5)
  }
  private func cornerRadiusView(){
    self.VC.cornerRadiusView.cornerRadius(10, true)
  }
  private func changeDaysView(){
    self.VC.changeDaysView.cornerRadius(5, true)
  }
  private func makeDonationView(){
    self.VC.makeDonationView.cornerRadius(5, true)
  }
  private func checkMarkButton(){
    self.VC.checkMarkButton.cornerRadius(5, true)
  }
  private func sorocoustTypeView(){
    self.VC.sorocoustTypeView.cornerRadius(5, true)
  }
  private func  buttonSvatIconViews(){
    self.VC.buttonSvatView.cornerRadius(5, true)
    self.VC.buttonIconView.cornerRadius(5, true)
    self.VC.buttonSvatView.borderColor(.set(.buttonYellow), 0.5)
    self.VC.buttonIconView.borderColor(.set(.buttonYellow), 0.5)
  }
  private func commentView(){
    self.VC.commentView.cornerRadius(5, true)
  }
  private func daysDonationButtons(){
    self.VC.daysDonationButtons[0].backgroundColor = .set(.buttonYellow)
    self.VC.daysDonationButtons[0].setTitleColor(.black, for: .normal)
  }
}
//MARK: - Initial
extension SetupPayNote{
  
  //MARK: - Inition
  convenience init(viewController: PayNoteViewController) {
    self.init()
    self.VC = viewController
  }
}

