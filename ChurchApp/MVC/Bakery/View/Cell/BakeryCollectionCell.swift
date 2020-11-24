//
// BakeryCollectionCell.swift
//  ChurchApp
import UIKit

class BakeryCollectionCell: UICollectionViewCell, LoadNidoble {
  
  private var controllers: BakeryControllers!
  
  public var product: DECProduct?
  
  @IBOutlet weak var priceProductButton : UIButton!
  @IBOutlet weak var productNameLabel   : UILabel!
  @IBOutlet weak var productWeightLabel : UILabel!
  @IBOutlet weak var backgraundImageView: UIImageView!
  
  
  public func configure(controllers: BakeryControllers?, product: DECProduct?){
    self.controllers = controllers
    self.product     = product
    self.controllers.present.collectionCellData(cell: self)
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    self.controllers.setup.bakeryCollectionCell(cell: self)
  }
  //MARK: -
  @IBAction func pusgBakeryInfoVCButton(button: UIButton){
    self.controllers.router.push(.BakeryInfo(self.product))
  }
}
