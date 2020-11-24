//
//  SafeAreaTop.swift
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

class SafeAreaTopView: UIView {
  
  public func setup(){
     backgroundColor = .set(.navBarFon)
   }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
