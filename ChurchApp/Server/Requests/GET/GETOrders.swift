//
//  GETServerUrl.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class GETOrders: Requestoble {
	
	private var urls       = URLs()
	private var parameters = URLParameters()
	private var headers    = URLHeaders()
	private var jsonDecode = JSONDecode()
  private var urlBody    = URLBody()
	
	public func type(data: Any?, completion: @escaping ClousureRequest) {
  
    let url     = self.urls.create(type: .orders(.orders))?.URL
    let header  = self.headers.create(type: .autorization_appJson)
    
		//Request
    self.jsonDecode.decode(jsonType: [DECOrder].self, url: url, header: header, httpMethod: .get) { (decodeResult) in
			//Responce
			switch decodeResult {
				//Error
				case .error(let error):
					completion(.error(error))
				//Susses
				case .json(let object):
          if let orders = object as? [DECOrder] {
					completion(.object(orders))
        }
			}
		}
	}
}
