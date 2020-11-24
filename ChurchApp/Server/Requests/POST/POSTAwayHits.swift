//
//  POSTAwayHits.swift
//  DG.BET
//
//  Created by Aleksandr on 26.02.2020.
//  Copyright © 2020 -=ALEKSANDR=-. All rights reserved.
//
import Foundation

class POSTAwayHits: Requestoble {
 
	var urls       = URLs()
	var parameters = URLParameters()
	var headers    = URLHeaders()
	var jsonDecode = JSONDecode()
  var urlBody    = URLBody()
	
	func type(data: Any?, completion: @escaping ClousureRequest) {
		
    //ceate body
    let data   = data as? ENCAwayHits
    let body   = try? JSONEncoder().encode(data)
    //carete url
    let url    = urls.create(type: .bookmakersOpenURL(.awayHits))?.URL
    let header = headers.create(type: .autorization_appJson)
		//Request
		self.jsonDecode.decode(jsonType: DECAwayHits.self, url: url, header: header, body: body, httpMethod: .post) { (decodeResult) in
			//Responce
			switch decodeResult {
				//Error
				case .error(let error):
					completion(.error(error))
				//Susses
				case .json(let object):
          if let awayHits = object as? DECAwayHits {
            completion(.object(awayHits))
          }
			}
		}
	}
}
