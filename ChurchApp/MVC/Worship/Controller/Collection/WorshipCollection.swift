//
//  WorshipCollection.swift
//  ChurchApp
//
//  Created by Senior Developer on 25.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class WorshipCollection : NSObject {
  
  //MARK: - Variable
  public var collectionView: UICollectionView!
  public var controllers   : WorshipControllers!
  public var worships      : [GDWorship]!
  
  private let choiceCell = ChoiceCollectionCell()
  private let sizeCell   = WorshipCellSize()
}

//MARK: - Delegate CollectionView
extension WorshipCollection: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
}

//MARK: - DataSource CollectionView
extension WorshipCollection: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    self.collectionView = collectionView
  return self.worships?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   return choiceCell.set(self.worships, .Worship, self.controllers, collectionView: collectionView, indexPath)
  }
}
//MARK: - DelegateFlowLayout  CollectionView
extension WorshipCollection: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return self.sizeCell.size(collectionView: collectionView, indexPath: indexPath, worships: self.worships)
  }
  
}


