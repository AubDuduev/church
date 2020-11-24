//
//  WorshipCollectionCell.swift
//  ChurchApp
import UIKit

class WorshipCollectionCell: UICollectionViewCell, LoadNidoble {
  
 
  private var controllers: WorshipControllers!
  
  public var worship: GDWorship?
  
  @IBOutlet weak var nameProgramLabel: UILabel!
  @IBOutlet weak var dateProgramLabel: UILabel!
  @IBOutlet weak var commonView      : UIView!
  @IBOutlet weak var programTableView: UITableView!
  
  public func configure(controllers: Controllers?, worship: GDWorship?){
    self.controllers = controllers as? WorshipControllers
    self.worship     = worship
    self.controllers.setup.programmTable(cell: self)
    self.controllers.present.worshipCollection(cell: self, worship: worship)
    self.controllers.present.data(cell: self)
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    self.controllers?.setup.cornerRadius(cell: self)
  }
}
