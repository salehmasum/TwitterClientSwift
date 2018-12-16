//
//  User.swift
//  TwitterLBTA
//
//  Created by user on 14/12/18.
//  Copyright © 2018 Lets Build That App. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import TRON

struct User: JSONDecodable {
    let name: String
    let username: String
    let bioText: String
    
    let profileImageUrl: String
    
    init(json: JSON) {
        self.name            = json["name"].stringValue
        self.username        = json["username"].stringValue
        self.bioText         = json["bio"].stringValue
        self.profileImageUrl  = json["profileImageUrl"].stringValue
    }
    
}
