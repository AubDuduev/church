//
//  SetupServicesCell.swift
//  ChurchApp
//
//  Created by Senior Developer on 23.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

extension SetupServices {
  
  public func cornerRadiusCell(cell: ServicesTableCell){
    cell.commonView.cornerRadius(8, false)
    cell.commonView.shadowColor(color: .gray, radius: 5)
    cell.serviceBackgraundIamgeView.cornerRadius(8, true)
    cell.cornerRadiusView.cornerRadius(8, true)
  }
}
