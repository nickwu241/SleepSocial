import Foundation

class Requests {
    static func createRequest(type: String, url: String) -> URLRequest? {
        guard let reqUrl = URL(string: url) else {
            print("ERROR: cannot create URL '\(url)'")
            return nil
        }
        var req = URLRequest(url: reqUrl)
        req.httpMethod = type
        return req
    }
    
    static func get(_ url: String) -> URLRequest? {
        return createRequest(type: "GET", url: url)
    }
    static func put(_ url: String) -> URLRequest? {
        return createRequest(type: "PUT", url: url)
    }
    static func DELETE(_ url: String) -> URLRequest? {
        return createRequest(type: "DELETE", url: url)
    }
    static func post(_ url: String) -> URLRequest? {
        return createRequest(type: "POST", url: url)
    }
}
