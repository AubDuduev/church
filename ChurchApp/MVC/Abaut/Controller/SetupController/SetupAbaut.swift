//
//  SetupAbaut.swift
//  ChurchApp

import Foundation

class SetupAbaut: Controller {
  
  //MARK: - Public variable
  public var VC: AbautViewController!
  
  public func viewDidLoad() {
    self.abautCollection()
  }
  
}
//MARK: - Private functions
extension SetupAbaut {
  
  private func abautCollection(){
    let collectionViewLayout = AbautCollectionViewLaytout()
    collectionViewLayout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
    collectionViewLayout.sectionInsetReference   = .fromContentInset
    collectionViewLayout.minimumLineSpacing      = 0
    collectionViewLayout.minimumInteritemSpacing = 0
    collectionViewLayout.scrollDirection         = .horizontal
    self.VC.abautCollectionView.collectionViewLayout = collectionViewLayout
    self.VC.abautCollection.collectionView           = self.VC.abautCollectionView
    self.VC.abautCollection.controllers              = self.VC.controllers
  }
}
//MARK: - Initial
extension SetupAbaut{
  
  //MARK: - Inition
  convenience init(viewController: AbautViewController) {
    self.init()
    self.VC = viewController
  }
}

