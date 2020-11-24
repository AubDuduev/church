//
//  POSTRegistration.swift
//  DgBetTrip
//
//  Created by Senior Developer on 20.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class POSTRegistration: Requestoble {
	
	var urls       = URLs()
	var parameters = URLParameters()
	var headers    = URLHeaders()
	var jsonDecode = JSONDecode()
  var urlBody    = URLBody()
	
	func type(data: Any?, completion: @escaping ClousureRequest) {
		
    let url    = self.urls.create(type: .registration(.token))?.URL
    let body   = self.urlBody.createEncoding(type: .Registration)
    let header = self.headers.create(type: .appJson)
		//Request
    self.jsonDecode.decode(jsonType: CODUserData.self, url: url, header: header, body: body, httpMethod: .post) { (decodeResult) in
			//Responce
			switch decodeResult {
				//Error
				case .error(let error):
					completion(.error(error))
				//Susses
				case .json(let object):
          if let userData = object as? CODUserData {
					completion(.object(userData))
          }
			}
		}
	}
}
