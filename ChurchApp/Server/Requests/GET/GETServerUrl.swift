//
//  GETServerUrl.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class GETServerUrl: Requestoble {
	
	var urls       = URLs()
	var parameters = URLParameters()
	var headers    = URLHeaders()
	var jsonDecode = JSONDecode()
  var urlBody    = URLBody()
	
	public func type(data: Any?, completion: @escaping ClousureRequest) {
  
    let url     = self.urls.create(type: .serverUrls)?.URL
    let header  = self.headers.create(type: .appJson)
    
		//Request
    self.jsonDecode.decode(jsonType: DECServerUrl.self, url: url, header: header, httpMethod: .get) { (decodeResult) in
			//Responce
			switch decodeResult {
				//Error
				case .error(let error):
					completion(.error(error))
				//Susses
				case .json(let object):
          if let serverUrl = object as? DECServerUrl {
					completion(.object(serverUrl))
        }
			}
		}
	}
}
