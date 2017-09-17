import Foundation
import UIKit

let NA: Double = -1

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

class SleepSummary {
    static var data: [Double] = [NA, NA, NA, NA, NA, NA, NA]
}
