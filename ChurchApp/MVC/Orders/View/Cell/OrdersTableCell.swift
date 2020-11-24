//
//  OrdersTableCell.swift
//  ChurchApp
import UIKit

class OrdersTableCell: UITableViewCell, LoadNidoble {
  
  private var controllers: OrdersControllers!
  
  public var order: DECOrder!
  
  @IBOutlet weak var numberLabel  : UILabel!
  @IBOutlet weak var dateLabel    : UILabel!
  @IBOutlet weak var summLabel    : UILabel!
  @IBOutlet weak var statusLabel  : UILabel!
  @IBOutlet weak var requrentLabel: UILabel!
  @IBOutlet weak var titleLabel   : UILabel!
  @IBOutlet weak var commonView   : UIView!
  
  public func configure(controllers: OrdersControllers?, order: DECOrder?){
    self.controllers = controllers
    self.order       = order
    self.controllers.present.data(cell: self)
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    self.controllers.setup.corner(cell: self)
  }
}
