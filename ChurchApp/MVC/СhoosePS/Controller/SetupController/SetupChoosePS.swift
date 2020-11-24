//
//  SetupChoosePS.swift
//  ChurchApp

import Foundation

class SetupChoosePS: Controller {
  
  //MARK: - Public variable
  public var VC: ChoosePSViewController!
  
  public func viewDidLoad() {
    self.choosePSTable()
    self.commonView()
    self.doneButton()
  }
}
//MARK: - Private functions
extension SetupChoosePS {
  
  private func choosePSTable(){
    self.VC.choosePSTable.controllers  = self.VC.controllers
    self.VC.choosePSTable.choosePSData = self.VC.choosePSData
  }
  private func commonView(){
    self.VC.commonView.cornerRadius(5, true)
  }
  private func doneButton(){
    self.VC.doneButton.cornerRadius(5, true)
  }
}
//MARK: - Private functions
extension SetupChoosePS {
  
  public func checkmarkButton(cell: ChoosePSTableCell){
    cell.checkmarkButton.cornerRadius(5, true)
    cell.checkmarkButton.borderColor(.set(.buttonYellow), 1)
  }
}
//MARK: - Initial
extension SetupChoosePS{
  
  //MARK: - Inition
  convenience init(viewController: ChoosePSViewController) {
    self.init()
    self.VC = viewController
  }
}

