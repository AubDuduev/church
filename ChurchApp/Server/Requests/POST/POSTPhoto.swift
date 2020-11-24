//
//  GETServerUrl.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class POSTPhoto: Requestoble {
	
	var urls       = URLs()
	var parameters = URLParameters()
	var headers    = URLHeaders()
	var jsonDecode = JSONDecode()
  var urlBody    = URLBody()
	
	public func type(data: Any?, completion: @escaping ClousureRequest) {
  
    let body    = data as! Data
    let url     = self.urls.create(type: .photoURL(.upload))?.URL
    let header  = self.headers.create(type: .uploadPhoto)
    
		//Request
    self.jsonDecode.decode(jsonType: DECPhotoURL.self, url: url, header: header, body: body, httpMethod: .post) { (decodeResult) in
			//Responce
			switch decodeResult {
				//Error
				case .error(let error):
					completion(.error(error))
				//Susses
				case .json(let object):
          if let photoURL = object as? DECPhotoURL {
					completion(.object(photoURL))
        }
			}
		}
	}
}
