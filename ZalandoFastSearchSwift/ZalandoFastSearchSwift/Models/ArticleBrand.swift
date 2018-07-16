//
//  ArticleBrand.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 16/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

struct ArticleBrand {
    var key: String
    var logoLargeUrl: String
    var logoUrl: String
    var name: String
    var shopUrl: String
    
    enum ArticleBrandKeys: String, CodingKey {
        case key
        case logoLargeUrl
        case logoUrl
        case name
        case shopUrl
    }
}

extension ArticleBrand: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArticleBrandKeys.self)
        key = try container.decode(String.self, forKey: .key)
        logoLargeUrl = try container.decode(String.self, forKey: .logoLargeUrl)
        logoUrl = try container.decode(String.self, forKey: .logoUrl)
        name = try container.decode(String.self, forKey: .name)
        shopUrl = try container.decode(String.self, forKey: .shopUrl)
    }
}

extension ArticleBrand: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ArticleBrandKeys.self)
        try container.encode(key, forKey: .key)
        try container.encode(logoLargeUrl, forKey: .logoLargeUrl)
        try container.encode(logoUrl, forKey: .logoUrl)
        try container.encode(name, forKey: .name)
        try container.encode(shopUrl, forKey: .shopUrl)
    }
}
