//
//  PresentCellServices.swift
//  ChurchApp
//
//  Created by Senior Developer on 24.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import SDWebImage
import Foundation

extension PresentServices {
  
  public func data(_ cell: ServicesTableCell){
    cell.serviceTitleLabel.text       = cell.service?.title
    cell.serviceDescriptionLabel.text = cell.service?.description
  }
  public func image(_ cell: ServicesTableCell){
    let urlImageBackgraund = self.VC.server.urls.get(type: .store(cell.service?.buttonFon)).URL
    let urlImageIcon       = self.VC.server.urls.get(type: .store(cell.service?.buttonIcon)).URL
    
    cell.serviceBackgraundIamgeView.isSkeletonable = true
    cell.serviceBackgraundIamgeView.showAnimatedGradientSkeleton()
    cell.serviceBackgraundIamgeView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .set(.projectBlue)))
    cell.serviceBackgraundIamgeView.sd_setImage(with: urlImageBackgraund) { (_, error, _, _) in
      if let error = error {
        print("Error load image serviceBackgraundIamgeView, Class: PresentServices", "Localized: \(error.localizedDescription)")
      } else {
        cell.serviceBackgraundIamgeView.hideSkeleton()
      }
    }
    cell.serviceIaconImageView.isSkeletonable = true
    cell.serviceIaconImageView.showAnimatedGradientSkeleton()
    cell.serviceIaconImageView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .set(.projectBlue)))
    cell.serviceIaconImageView.sd_setImage(with: urlImageIcon) { (_, error, _, _) in
      if let error = error {
        print("Error load image serviceIaconImageView, Class: PresentServices", "Localized: \(error.localizedDescription)")
      } else {
        cell.serviceIaconImageView.hideSkeleton()
      }
    }
  }
}
