//
//  Sessionoble.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

protocol Sessionoble {
	
	func session(url: URL?, body: Data?, httpMethod: String.HTTPMethod, header: Header?, completion: @escaping ClousureSession)
}

extension Sessionoble {
	
	func session(url: URL?, body: Data? = nil, httpMethod: String.HTTPMethod, header: Header? = nil, completion: @escaping ClousureSession){
		guard let url = url else { return }
		var request   = URLRequest(url: url)
		request.httpMethod = httpMethod.rawValue
		request.allHTTPHeaderFields = header
		request.httpBody  = body
    let configuration = URLSessionConfiguration.default
    let session       = URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
    //Request responce
    let dataTask = session.dataTask(with: request) {(data, response, error) in
      //error return response
      if let error = error {
        completion(.error(error))
        //data return responce
      } else {
        guard let data = data else { return }
        print(response?.url?.absoluteString as Any, "Sessionoble response URL absoluteString")
        completion(.data(data))
      }
    }
    dataTask.resume()
  }
}
