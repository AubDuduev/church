//
//  BakberyCollection.swift
//  ChurchApp
//
//  Created by Senior Developer on 26.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class BakeryCollection : NSObject {
  
  //MARK: - Variable
  public var collectionView: UICollectionView!
  public var controllers   : BakeryControllers!
  public var products      : [DECProduct]!
}

//MARK: - Delegate CollectionView
extension BakeryCollection: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
}

//MARK: - DataSource CollectionView
extension BakeryCollection: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    self.collectionView = collectionView
  return self.products?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = BakeryCollectionCell().collectionCell(collectionView, indexPath: indexPath)
    cell.configure(controllers: controllers, product: self.products?[indexPath.row])
    return cell
  }
}
//MARK: - DelegateFlowLayout  CollectionView
extension BakeryCollection: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width : CGFloat = (collectionView.bounds.width / 2) - 24
    let height: CGFloat = width + 50
    return .init(width: width, height: height)
  }
  
}


