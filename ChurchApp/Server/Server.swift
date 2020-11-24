//
//  Server.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

class Server {
	
	//MARK: - Public variable
	public let urls       = URLs()
	public let parameters = URLParameters()
	public let headers    = URLHeaders()
  
	//MARK: - Private variable
	private var requestoble : Requestoble!
	private let network     = Network()
  private let requests    = ServerRequests()
	
	//MARK: - Request Server
  public func request(requestType: ServerRequests.RequestType, data: Any? = nil, completion: @escaping ClousureServerResult){
		
		//check network
		guard self.network.check() else { return }
		
		//create type request
    requestoble = self.requests.set(type: requestType)
		
		//request
		requestoble.type(data: data) { (requestResult) in
			//responce
			switch requestResult{
				//susses
				case .object(let json):
					DispatchQueue.main.async {
						completion(.object(json))
				}
				//error
				case .error(let error):
					DispatchQueue.main.async {
						completion(.error(error))
				}
			}
		}
	}
}







