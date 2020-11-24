//
//  URLCreatoble.swift
//  ChurchApp
//
//  Created by Senior Developer on 23.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

protocol URLCreatoble {
  
  func url(_ type: URLType.Types) -> ReturnURL?
}
