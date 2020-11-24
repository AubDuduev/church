//
//  SetupBakery.swift
//  ChurchApp

import Foundation

class SetupBakery: Controller {
  
  //MARK: - Public variable
  public var VC: BakeryViewController!
  
  public func viewDidLoad() {
    self.bakeryCollection()
    self.navBarView()
  }
}
//MARK: - Private functions
extension SetupBakery {
  
  private func bakeryCollection(){
    self.VC.bakeryCollection.controllers = self.VC.controllers
    self.VC.bakeryCollectionLayout.sectionInset = .init(top: 0, left: 10, bottom: 10, right: 10)
    self.VC.bakeryCollectionLayout.sectionInsetReference = .fromLayoutMargins
    self.VC.bakeryCollectionView.collectionViewLayout = self.VC.bakeryCollectionLayout
  }
  private func navBarView(){
    self.VC.navBarView.shadowColor(color: .lightGray, radius: 5)
  }
}
//MARK: - Private functions
extension SetupBakery {
  
  public func bakeryCollectionCell(cell: BakeryCollectionCell){
    cell.priceProductButton.cornerRadius(5, false)
    cell.contentView.cornerRadius(7, true)
    cell.cornerRadius(7, false)
    cell.shadowColor(color: .black, radius: 5)
  }
}
//MARK: - Initial
extension SetupBakery{
  
  //MARK: - Inition
  convenience init(viewController: BakeryViewController) {
    self.init()
    self.VC = viewController
  }
}

