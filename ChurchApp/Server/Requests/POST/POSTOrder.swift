//
import Foundation

class POSTOrder: Requestoble {
	
	private var urls       = URLs()
	private var parameters = URLParameters()
	private var headers    = URLHeaders()
	private var jsonDecode = JSONDecode()
  private var urlBody    = URLBody()
	
	public func type(data: Any?, completion: @escaping ClousureRequest) {
  
    let order  = data as! ENCOrder
    let body   = self.urlBody.createEncoding(type: .Order(order))
    let url    = self.urls.create(type: .orders(.orders))?.URL
    let header = self.headers.create(type: .autorization_appJson)
    print("---order----")
    print(order)
    print("---body----")
    print(String(data: body!, encoding: .utf8)!)
  
		//Request
    self.jsonDecode.decode(jsonType: DECOrder.self, url: url, header: header, body: body, httpMethod: .post) { (decodeResult) in
			//Responce
			switch decodeResult {
				//Error
				case .error(let error):
					completion(.error(error))
				//Susses
				case .json(let object):
          if let order = object as? DECOrder {
					completion(.object(order))
        }
			}
		}
	}
}
