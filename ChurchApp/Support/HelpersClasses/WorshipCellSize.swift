//
//  WorshipCellSize.swift
//  ChurchApp
//
//  Created by Senior Developer on 14.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class WorshipCellSize {
  
  public func size(collectionView: UICollectionView, indexPath: IndexPath, worships: [GDWorship]) -> CGSize {
    switch self.coice(worships: worships, indexPath: indexPath) {
      case .Cell:
        let width : CGFloat = collectionView.bounds.width - 24
        let height: CGFloat = CGFloat(70 + (50 * (worships[indexPath.row].program?.count ?? 0)))
        return .init(width: width, height: height)
      case .Stream:
        let width : CGFloat = collectionView.bounds.width - 24
        let height: CGFloat = 210
        return .init(width: width, height: height)
    }
  }
  private func coice(worships: [GDWorship], indexPath: IndexPath) -> Types {
    
    switch worships[indexPath.row].worshipType {
      case .program:
        return .Cell
      case .stream:
        return .Stream
      default:
        return .Cell
    }
  }
  enum Types {
    case Cell
    case Stream
  }
}
