//
//  ProgressDonationView.swift
//  ChurchApp
//
//  Created by Senior Developer on 28.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class ProgressChartView: UIView {
  
  public var progress : CGFloat = 5
  private let shapeLayer = CAShapeLayer()
  
  public func animation(){
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    basicAnimation.fromValue = 0
    basicAnimation.toValue   = 1
    basicAnimation.duration  = 3
    self.shapeLayer.add(basicAnimation, forKey: "strokeEnd")
  }
  public func createCircle(gradus: CGFloat){
    self.layer.backgroundColor = UIColor.clear.cgColor
    let circlePath = UIBezierPath(arcCenter: self.center, radius: 95, startAngle: 0, endAngle: .radians(gr: gradus), clockwise: true)
    shapeLayer.path         = circlePath.cgPath
    shapeLayer.fillColor    = UIColor.clear.cgColor
    shapeLayer.strokeColor  = UIColor.set(.tabBarClick).cgColor
    shapeLayer.lineWidth    = 10
    circlePath.lineCapStyle = .round
    shapeLayer.lineCap      = .round
    self.layer.addSublayer(shapeLayer)
  }
}
