import Foundation
import Alamofire

typealias Parameters = [String: Any]

typealias Headers = [String: String]

protocol ParametersGetter {
    func getParameters()-> Parameters
}

protocol HttpRequest {
    var encoding: ParameterEncoding {get}
    var path: String {get}
    var method: HttpMethod {get}
    var parameters: [String: Any]? {get}
    var headers: [String: String]? {get}
}

public enum HttpMethod : String {
    
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
    
    var alamofire: HTTPMethod {
        get {
            switch self {
            case .get: return .get
            case .post: return .post
            case .delete: return .delete
            case .patch: return .patch
            case .put: return .put
            case .options: return .options
            case .head: return .head
            case .trace: return .trace
            case .connect: return .connect
            }
        }
    }
    
}

func NetworkLogger(_ request: URLRequest) {
    
    print("\n - - - - - - - - - - OUTGOING - - - - - - - - - - \n")
    defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
    
    let urlAsString = request.url?.absoluteString ?? ""
    let urlComponents = NSURLComponents(string: urlAsString)
    
    let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
    let path = "\(urlComponents?.path ?? "")"
    let query = "\(urlComponents?.query ?? "")"
    let host = "\(urlComponents?.host ?? "")"
    
    var logOutput = """
    \(urlAsString) \n\n
    \(method) \(path)?\(query) HTTP/1.1 \n
    HOST: \(host)\n
    """
    for (key,value) in request.allHTTPHeaderFields ?? [:] {
        logOutput += "\(key): \(value) \n"
    }
    if let body = request.httpBody {
        logOutput += "\n \(NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "")"
    }
    
    print(logOutput)
}


typealias NetworkData = Data
