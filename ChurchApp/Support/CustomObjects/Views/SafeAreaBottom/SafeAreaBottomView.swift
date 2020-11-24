//
//  SafeAreaBottomView.swift
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

class SafeAreaBottomView: UIView {
  
  public func setup(){
     backgroundColor = .set(.tabBarFon)
   }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
}
