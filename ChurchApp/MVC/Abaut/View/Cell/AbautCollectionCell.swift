//
//  AbautCollectionCell.swift
//  ChurchApp
import UIKit

class AbautCollectionCell: UICollectionViewCell, LoadNidoble {
  
  private var controllers: AbautControllers!
  
  @IBOutlet weak var previewImageView: UIImageView!
  
  public func configure(controllers: AbautControllers?, indexPath: IndexPath){
    self.controllers = controllers
    self.previewImageView.image = AbautPreview.image(indexPath: indexPath)
  }
  
}
