import Foundation

func signUp(username: String, password: String) {
    signIn(username: username, pw: password, createNewAccount: true)
}

func signIn(username: String, password: String) {
    signIn(username: username, pw: password, createNewAccount: false)
}

func recordSleepTime() {
    record("sleepTime")
}

func recordWakeupTime() {
    record("wakeupTime")
}

fileprivate let SSendpoint = "https://sleep-tracker.azurewebsites.net/api/HttpTriggerJS1?code=j3aHDW2K2DAesDA49Rq68wZvHt8Gl/3V12TXqh/WDdPJnWRKhwGZhQ=="

fileprivate enum RecordTime {
    case sleeping, wakeup
}

fileprivate func record(_ actionType: String) {
    guard var urlRequest = Requests.post(SSendpoint) else {
        return
    }
    urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
    let body: [String: Any] = ["actionType": actionType, "accessToken": AppSession.accessToken!]
    let jsonBody: Data
    do {
        jsonBody = try JSONSerialization.data(withJSONObject: body, options: [])
        urlRequest.httpBody = jsonBody
    } catch {
        print("ERROR: cannot create JSON")
        return
    }
    
    let task = AppSession.urlSession.dataTask(with: urlRequest) {
        (data, response, error) in
        guard error == nil else {
            print("ERROR: calling POST")
            print(error!)
            return
        }
        
        guard let responseData = data else {
            print("ERROR: did not receive data")
            return
        }
        
        do {
            guard let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: [])
                as? [String: Any] else {
                    print("ERROR1: trying to convert data to JSON")
                    return
            }
            print(jsonResponse)
        }
        catch {
            print("ERROR2: trying to convert data to JSON")
            return
        }
    }
    task.resume()
}

fileprivate func signIn(username: String, pw: String, createNewAccount: Bool) {
    guard var urlRequest = Requests.post(SSendpoint) else {
        return
    }
    urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
    
    let actionType = createNewAccount ? "signup" : "signin"
    let body: [String: Any] = ["username": username, "password": pw, "actionType" : actionType]
    let jsonBody: Data
    do {
        jsonBody = try JSONSerialization.data(withJSONObject: body, options: [])
        urlRequest.httpBody = jsonBody
    } catch {
        print("ERROR: cannot create JSON")
        return
    }
    
    let task = AppSession.urlSession.dataTask(with: urlRequest) {
        (data, response, error) in
        guard error == nil else {
            print("ERROR: calling POST")
            print(error!)
            return
        }
        
        guard let responseData = data else {
            print("ERROR: did not receive data")
            return
        }
        
        do {
            guard let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: [])
                as? [String: Any] else {
                    print("ERROR: trying to convert data to JSON")
                    return
            }
            
            print(jsonResponse)
            
            if !createNewAccount {
                guard let accessToken = jsonResponse["accessToken"] else {
                    print("ERROR1: no accessToken in response body")
                    return
                }
                AppSession.accessToken = String(describing: accessToken)
            }
        }
        catch {
            print("ERROR2: trying to convert data to JSON")
            return
        }
    }
    task.resume()
}