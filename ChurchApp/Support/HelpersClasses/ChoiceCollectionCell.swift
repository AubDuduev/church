//
//  ChoiceCollectionCell.swift
//  ChurchApp
//
//  Created by Senior Developer on 14.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ChoiceCollectionCell {
  
  public func set(_ worships: [GDWorship], _ type: ChoiceCollectionCell.Types, _ controllers: Controllers?, collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
    
    let worship = worships[indexPath.row]
    
    switch self.choice(worship: worship, type: type) {
      case .Stream:
        let cell = StreamCollectionCell().collectionCell(collectionView, indexPath: indexPath)
        cell.configure(controllers: controllers, worship: worships[indexPath.row])
        return cell
      case .Worship:
        let cell = WorshipCollectionCell().collectionCell(collectionView, indexPath: indexPath)
        cell.configure(controllers: controllers, worship: worships[indexPath.row])
        return cell
      case .None:
        return UICollectionViewCell()
    }
  }
  private func choice(worship: GDWorship, type: Types) -> Types {
    
    switch worship.worshipType {
      case  .stream:
        return .Stream
      case .program :
        return .Worship
      default:
        return .None
    }
  }
  enum Types {
    
    case Stream
    case Worship
    case None
  }
}
