//
//  ServicesTableCell.swift
//  ChurchApp
import UIKit

class ServicesTableCell: UITableViewCell, LoadNidoble {
  
  
  @IBOutlet weak var serviceBackgraundIamgeView: UIImageView!
  @IBOutlet weak var serviceIaconImageView     : UIImageView!
  @IBOutlet weak var serviceTitleLabel         : UILabel!
  @IBOutlet weak var serviceDescriptionLabel   : UILabel!
  @IBOutlet weak var commonView                : UIView!
  @IBOutlet weak var cornerRadiusView          : UIView!
  
  private var controllers : ServicesControllers!
  private var index       = 0
  private var serviceType : ServiceType!
  
  public var service: DECService?
  
  public func configure(controllers: ServicesControllers?, service: DECService?, index: Int){
    self.controllers = controllers
    self.service     = service
    self.serviceType = ServiceType(rawValue: service?.alias ?? "")
    self.controllers.present.data(self)
    self.controllers.present.image(self)
    self.index = index
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    self.controllers.setup.cornerRadiusCell(cell: self)
  }
  @IBAction func pushVCButton(button: UIButton){
    self.controllers.router.push(self.serviceType, service: self.service)
  }
}
