//
//  SetupOtherTable.swift
//  ChurchApp

import Foundation

class SetupOtherTable: Controller {
  
  //MARK: - Public variable
  public var VC: OtherTableViewController!
  
  public func viewDidLoad() {
    self.cellCommonViews()
    self.avatarImageView()
  }
}
//MARK: - Private functions
extension SetupOtherTable {
  
  private func cellCommonViews(){
    self.VC.cellCommonViews.forEach{ $0.cornerRadius(10, true)}
    self.VC.cellCommonViews.forEach{ $0.shadowColor(color: .gray, radius: 5)}
  }
  private func avatarImageView(){
    self.VC.avatarImageView.cornerRadius(15, true)
  }
}
//MARK: - Initial
extension SetupOtherTable{
  
  //MARK: - Inition
  convenience init(viewController: OtherTableViewController) {
    self.init()
    self.VC = viewController
  }
}

