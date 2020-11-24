//
//  PrayersTableCell.swift
//  ChurchApp
import UIKit

class PrayersTableCell: UITableViewCell, LoadNidoble {
  
 
  private var controllers: PrayersControllers!
  
  public var prayer: DECPrayer!
  
  @IBOutlet weak var titlePrayerLabel: UILabel!
  
  public func configure(controllers: PrayersControllers?, prayer: DECPrayer?){
    self.controllers = controllers
    self.prayer      = prayer
    self.controllers?.present.data(cell: self)
  }

  @IBAction func presentPrayerButton(button: UIButton){
    guard self.prayer != nil else { return }
    self.controllers.logic.presentPrayer(prayer: self.prayer)
  }
}
