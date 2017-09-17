import Foundation

class AppSession {
    static let urlSession = URLSession.shared
    
    static var accessToken: String? {
        didSet {
            if accessToken != nil {
                print("accessToken = \(accessToken!)")
                //recordSleepTime()
                //recordWakeupTime()
            }
        }
    }
    
}
