//
//  ResponseModel.swift
//  ContinueWorking2
//
//  Created by Ahmed Qazzaz on 08/12/2021.
//

import UIKit

struct ResponseModel : Codable{
    var status : Bool
    var message : String
    var user : User?
    
    static func object(_ d: Data)-> ResponseModel? {
        do{
            return try JSONDecoder().decode(ResponseModel.self, from: d)
        }catch{
            print(error)
        }
         return nil
    }
    
    func getData()->Data?{
        do{
            return try JSONEncoder().encode(self)
        }catch{
            print(error)
        }
        
        return nil
    }
    
}

struct User : Codable{
    var username : String
    var firstName : String
    var lastName : String
    var dateOfBirth : Date
    var userID : Int
}
