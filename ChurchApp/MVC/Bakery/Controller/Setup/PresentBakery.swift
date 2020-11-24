//
//  PresentBakery.swift
//  ChurchApp

import Foundation

class PresentBakery: Controller {
  
  //MARK: - Public variable
  public var VC: BakeryViewController!
  
  public func collectionData(products: [DECProduct]?){
    self.VC.bakeryCollection.products = products
    self.VC.bakeryCollection.collectionView.reloadData()
  }
}
//MARK: - Collection BakeryCollectionCell
extension PresentBakery {
  
  public func collectionCellData(cell: BakeryCollectionCell){
     cell.priceProductButton.setTitle("Купить за \(cell.product?.price ?? 0) ₽", for: .normal)
     cell.productNameLabel.text = "Хлеб мини \(cell.product?.title ?? "")"
  }
}
//MARK: - Initial
extension PresentBakery{
  
  //MARK: - Inition
  convenience init(viewController: BakeryViewController) {
    self.init()
    self.VC = viewController
  }
}

