//
//  Service.swift
//  TwitterLBTA
//
//  Created by user on 16/12/18.
//  Copyright © 2018 Lets Build That App. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDataSource?, Error?) -> () ) {
        let request: APIRequest<HomeDataSource, JsonError> = tron.swiftyJSON.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
            
            print(homeDatasource.users.count)
    
            completion(homeDatasource, nil)
            
            
        }) { (error) in
            completion(nil, error)
            print("Failed to parse json: ", error)
        }
    }
    
    class JsonError: JSONDecodable {
        
        required init(json: JSON) throws {
            print("JSON error")
        }
        
    }
    
}
