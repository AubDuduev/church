//
//  GETServerUrl.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class PATHUserData: Requestoble {
	
	var urls       = URLs()
	var parameters = URLParameters()
	var headers    = URLHeaders()
	var jsonDecode = JSONDecode()
  var urlBody    = URLBody()
	
	public func type(data: Any?, completion: @escaping ClousureRequest) {
  
    let userData = data as! ENCUserData
    let body     = self.urlBody.createEncoding(type: .UserData(userData))
    let url      = self.urls.create(type: .userData(.users, .userID))?.URL
    let header   = self.headers.create(type: .autorization_appJson)
		//Request
    self.jsonDecode.decode(jsonType: CODUserData.self, url: url, header: header, body: body, httpMethod: .patch) { (decodeResult) in
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
