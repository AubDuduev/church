//
//  Extension + UIScrollView.swift
//  DgBetTrip
//
//  Created by Senior Developer on 21.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

extension UIScrollView {
  
  public func isBottom(to: CGFloat) -> Bool {
    let contentHeight  = self.contentSize.height
    let contentVizible = self.visibleSize.height
    let result = (contentHeight - contentVizible) - to
    if self.contentOffset.y >= result {
      return false
    } else {
      return true
    }
  }
  
  public func isTop(to: CGFloat) -> Bool {
    if self.contentOffset.y == to {
      return true
    } else {
      return false
    }
  }
}
