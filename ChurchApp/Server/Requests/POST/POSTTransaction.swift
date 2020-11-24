//
//  GETServerUrl.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class POSTTransaction: Requestoble {
	
	var urls       = URLs()
	var parameters = URLParameters()
	var headers    = URLHeaders()
	var jsonDecode = JSONDecode()
  var urlBody    = URLBody()
	
	public func type(data: Any?, completion: @escaping ClousureRequest) {
  
    let data    = data as! ENCTransaction
    let body    = self.urlBody.createEncoding(type: .Transaction(data))
    let url     = self.urls.create(type: .transaction(.payments))?.URL
    let header  = self.headers.create(type: .autorization_appJson)
		//Request
    self.jsonDecode.decode(jsonType: DECTransaction.self, url: url, header: header, body: body, httpMethod: .post) { (decodeResult) in
			//Responce
			switch decodeResult {
				//Error
				case .error(let error):
					completion(.error(error))
				//Susses
				case .json(let object):
          if let transaction = object as? DECTransaction {
					completion(.object(transaction))
        }
			}
		}
	}
}
