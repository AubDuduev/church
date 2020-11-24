//
//  ChoosePSTableCell.swift
//  ChurchApp
import UIKit

class ChoosePSTableCell: UITableViewCell, LoadNidoble {
  
  private var controllers: ChoosePSControllers!
  
  public var indexPath: IndexPath!
  
  @IBOutlet weak var nameLabel      : UILabel!
  @IBOutlet weak var checkmarkButton: UIButton!
  
  public func configure(controllers: ChoosePSControllers?, indexPath: IndexPath, type: ChoosePSData.ChoosePSType){
    self.controllers = controllers
    self.indexPath   = indexPath
    
    switch type {
      case .Icon:
        self.nameLabel.text = Icons.allCases[indexPath.row].rawValue
      case .Saint:
        self.nameLabel.text = Saints.allCases[indexPath.row].rawValue
    }
    self.controllers.present.recurrentDonation(cell: self)
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    self.controllers.setup.checkmarkButton(cell: self)
  }
  @IBAction func checkmarkButton(button: UIButton){
    var state = StoreProject.shared.getBool(keyString: self.nameLabel.text)
    state.toggle()
    StoreProject.shared.saveBool(keyString: nameLabel.text, value: state)
    self.controllers.present.recurrentDonation(cell: self)
  }
}
