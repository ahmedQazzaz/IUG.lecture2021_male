//
//  AuthServices.swift
//  ContinueWorking2
//
//  Created by Ahmed Qazzaz on 04/12/2021.
//

import UIKit

class AuthServices {
    
    func loginUsing(username: String, password: String, atComplete handeler: @escaping(_: ResponseModel?)->Void){
        //http://10.2.197.172:8080
        var urlComponent = URLComponents(string: "http://10.2.197.172:8080/api/login")
        urlComponent?.queryItems = [URLQueryItem(name: "username", value: username),
                                    URLQueryItem(name: "password", value: password)]
        
//        if let url = URL(string: "http://google.com"){
        if let url = urlComponent?.url{
            //http://google.com?username=asd%20fg&password=123456
            var request = URLRequest(url: url)
            request.httpMethod =  "GET" //"POST" // "GET" // "PUT" // "DELETE" // "PATCH"
            request.allHTTPHeaderFields = ["Content-Type": "application/json"]
            
            let rawData = "username=\(username)&password=\(password)"
            let formData = ["username": username,
                            "password" : password]
            
//            request.httpBody = rawData.data(using: .utf8)
//            request.httpBody = try? JSONSerialization.data(withJSONObject: formData, options: .fragmentsAllowed)
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                // Receive Response
                if let error = error {
                    print(error)
                }else{
                    if let data = data {
                        //let jsonString = String(data: data, encoding: .utf8)
                        //print(jsonString)
                        let r = ResponseModel.object(data)
                        handeler(r)
                    }
                }
            }
            
            task.resume() // << Send request
            
            //"http://google.com/user/{id}" //<< REST FULL API {Parameter}
            //"http://google.com?abc=123&efg=784" // << Query
            
        }
    }
    
}
