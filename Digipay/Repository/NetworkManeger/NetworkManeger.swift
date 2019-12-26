import Foundation
import Alamofire
import SwiftyJSON
import SpotifyLogin

typealias HeaderFields = [AnyHashable : Any]

protocol NetworkManeger {
    func request(_ request: HttpRequest, completion: @escaping (NetworkResult<NetworkData?, NetworkResponseStatus>) -> Void)
}

class NetworkManegerImp: NetworkManeger  {
    
    func request(_ request: HttpRequest, completion: @escaping (NetworkResult<NetworkData?, NetworkResponseStatus>) -> Void) {
        
        SpotifyLogin.shared.getAccessToken { (token, error) in
            
            var header = request.headers!
            header["Authorization"] = "Bearer " + (token ?? "")
            
            Alamofire.request(request.path, method: request.method.alamofire, parameters: request.parameters, encoding: request.encoding , headers: header).responseJSON { (response) in
                
                let json = try? JSON(data: response.data ?? Data())
                //                debugPrint(json ?? "")
                
                let message = json?["error"]["message"].string ?? ""
                let status = NetworkResponseStatus(statusCode: response.response?.statusCode, message: message)
                
                if status.isSuccess {
                    completion(.success(response.data))
                } else {
                    completion(.failure(status))
                }
            }
            
        }
        
    }
    
}

