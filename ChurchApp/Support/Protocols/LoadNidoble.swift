//
//  LoadNidoble.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

protocol LoadNidoble {
  
  func tableCell() -> Self
  func collectionCell(_ collection: UICollectionView, indexPath: IndexPath) -> Self
  func loadNibFile() -> UINib
  
}

extension LoadNidoble {
  
  func tableCell() -> Self {
    let nib = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first
    return nib as! Self
  }
  func loadNibFile() -> UINib {
    return UINib(nibName: String(describing: Self.self), bundle: nil)
  }
  func collectionCell(_ collection: UICollectionView, indexPath: IndexPath) -> Self {
    let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
    collection.register(nib, forCellWithReuseIdentifier: String(describing: Self.self))
    let cell = collection.dequeueReusableCell(withReuseIdentifier: String(describing: Self.self), for: indexPath)
  return cell as! Self
  }
}
