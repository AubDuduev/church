//
//  PresentChoosePS.swift
//  ChurchApp

import Foundation

class PresentChoosePS: Controller {
  
  //MARK: - Public variable
  public var VC: ChoosePSViewController!
  
  public func recurrentDonation(cell: ChoosePSTableCell){
    self.VC.cellState[cell.indexPath.row].state = StoreProject.shared.getBool(keyString: cell.nameLabel.text)
    if !self.VC.cellState[cell.indexPath.row].state {
      cell.checkmarkButton.setImage(nil, for: .normal)
      cell.checkmarkButton.backgroundColor = .white
    } else {
      cell.checkmarkButton.setImage(#imageLiteral(resourceName: "checkMakeDonation.pdf"), for: .normal)
      cell.checkmarkButton.backgroundColor = .set(.buttonYellow)
    }
  }
}
//MARK: - Initial
extension PresentChoosePS{
  
  //MARK: - Inition
  convenience init(viewController: ChoosePSViewController) {
    self.init()
    self.VC = viewController
  }
}

