//
//  AbautCollection.swift
//  ChurchApp
//
//  Created by Senior Developer on 29.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class AbautCollection : NSObject {
  
  //MARK: - Variable
  public var collectionView: UICollectionView!
  public var controllers   : AbautControllers!
}

//MARK: - Delegate CollectionView
extension AbautCollection: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    self.controllers.logic.setIndexPageControll(indexPath: indexPath)
  }
}

//MARK: - DataSource CollectionView
extension AbautCollection: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    self.collectionView = collectionView
    return AbautPreview.allCases.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = AbautCollectionCell().collectionCell(collectionView, indexPath: indexPath)
    cell.configure(controllers: controllers, indexPath: indexPath)
    return cell
  }
}
//MARK: - DelegateFlowLayout  CollectionView
extension AbautCollection: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width : CGFloat = collectionView.bounds.width
    let height: CGFloat = collectionView.bounds.height
    return .init(width: width, height: height)
  }
  
}


