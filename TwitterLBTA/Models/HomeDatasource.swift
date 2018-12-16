//
//  HomeDatasource.swift
//  TwitterLBTA
//
//  Created by user on 13/12/18.
//  Copyright © 2018 Lets Build That App. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map{ try T(json: $0)}
    }
}

class HomeDataSource: Datasource, JSONDecodable {
    
    var users: [User]
    
    required init(json: JSON) throws {
        
        guard let userJsonArray = json["users"].array, let tweetArray = json["tweets"].array else {
            throw(NSError(domain: "com.salehdomain.com", code: 1, userInfo: [NSLocalizedDescriptionKey: "parsing json Not valid."]))
        }
        
        self.users  = try userJsonArray.decode()
        self.tweets = try tweetArray.decode()
        
    }
    
    let tweets: [Tweet]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self] 
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count 
        }
        return users.count
    }
    
}
