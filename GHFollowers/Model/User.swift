//
//  User.swift
//  GHFollowers
//
//  Created by Lonnie Gerol on 1/5/20.
//  Copyright © 2020 Lonnie Gerol. All rights reserved.
//

import Foundation
struct User: Codable{
    var login: String
    var avatarURL: String
    var name: String?
    var location: String?
    var bio: String
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
