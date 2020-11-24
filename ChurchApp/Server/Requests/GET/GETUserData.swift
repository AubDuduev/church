//
//  GETUserData.swift
//  DG.BET
//
//  Created by Senior Developer on 07.04.2020.
//  Copyright © 2020 -=ALEKSANDR=-. All rights reserved.
//
import Foundation

class GETUserData: Requestoble {
	
	var urls       = URLs()
	var parameters = URLParameters()
	var headers    = URLHeaders()
	var jsonDecode = JSONDecode()
  var urlBody    = URLBody()
	
	func type(data: Any?, completion: @escaping ClousureRequest) {
		
    let url    = urls.create(type: .userData(.users, .userID))?.URL
    let header = headers.create(type: .autorization_appJson)
		//Request
    self.jsonDecode.decode(jsonType: CODUserData.self, url: url, header: header, httpMethod: .get) { (decodeResult) in
			//Responce
			switch decodeResult {
				//Error
				case .error(let error):
          print(error!.localizedDescription, "Error class - GETUserData")
					completion(.error(error))
				//Susses
				case .json(let object):
          if let userData  = object as? CODUserData {
					completion(.object(userData))
          }
			}
		}
	}
}
