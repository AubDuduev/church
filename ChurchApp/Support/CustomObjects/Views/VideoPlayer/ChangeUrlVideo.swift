//
//  ChangeUrlVideo.swift
//  DgBetTrip
//
//  Created by Senior Developer on 03.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation
import UIKit

class ChangeUrlVideo {
  
  private var videoPathURL: URL! = nil
  
  public func change(typeVideoURL: TypeVideoURL, typeVideo: TypeVideo = .mp4) -> URL? {
    
    switch typeVideoURL {
      
      case .derectory(let derictory):
        if let urlString = derictory {
          self.videoPathURL = URL(fileURLWithPath: urlString, isDirectory: true)
      }
      case .network(let urlString):
        if let urlString = urlString {
          self.videoPathURL = URL(string: urlString)
      }
      case .bandle(let urlPath):
        if let videoPath = Bundle.main.path(forResource: urlPath, ofType: typeVideo.rawValue) {
          self.videoPathURL = URL(fileURLWithPath: videoPath)
        } else {
          return nil }
      }
  return videoPathURL
  }
}
