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

extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()
}
extension Date {
    var iso8601: String {
        return Formatter.iso8601.string(from: self)
    }
}

extension String {
    var dateFromISO8601: Date? {
        return Formatter.iso8601.date(from: self)   // "Mar 22, 2017, 10:22 AM"
    }
}
