//
//  Extension + UITableView.swift
//  DgBetTrip
//
//  Created by Senior Developer on 29.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

extension UITableView {
  
  func scrollTo(_ to: ScrollPosition){
    
    switch to {
      case .bottom:
        let numberOfSections = self.numberOfSections
        guard numberOfSections != 0 else { return }
        let numberOfRows     = self.numberOfRows(inSection: numberOfSections - 1)
        if numberOfRows > 0 {
          let indexPath = IndexPath(row: numberOfRows - 1, section: (numberOfSections - 1))
          self.scrollToRow(at: indexPath, at: to, animated: true)
        }
      case .top:
        let indexPath = IndexPath(row: 0, section: 0)
        self.scrollToRow(at: indexPath, at: to, animated: true)
      default:
        break
    }
  }
}
extension UITableView {
  
  @IBInspectable var backgroundImage: UIImage? {
    get {
      return nil
    }
    set {
      let imageView  = UIImageView(image: newValue)
      imageView.contentMode = .scaleAspectFill
      backgroundView = imageView
    }
  }
}
