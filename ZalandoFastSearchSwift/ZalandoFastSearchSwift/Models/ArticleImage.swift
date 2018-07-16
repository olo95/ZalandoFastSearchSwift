//
//  ArticleImage.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 16/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

struct ArticleImage {
    var largeHdUrl: String
    var largeUrl: String
    var mediumHdUrl: String
    var orderNumber: Int
    var smallHdUrl: String
    var smallUrl: String
    var thumbnailHdUrl: String
    var type: String
    
    enum ArticleImageKeys: String, CodingKey {
        case largeHdUrl
        case largeUrl
        case mediumHdUrl
        case orderNumber
        case smallHdUrl
        case smallUrl
        case thumbnailHdUrl
        case type
    }
}

extension ArticleImage: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArticleImageKeys.self)
        largeHdUrl = try container.decode(String.self, forKey: .largeHdUrl)
        largeUrl = try container.decode(String.self, forKey: .largeUrl)
        mediumHdUrl = try container.decode(String.self, forKey: .mediumHdUrl)
        orderNumber = try container.decode(Int.self, forKey: .orderNumber)
        smallHdUrl = try container.decode(String.self, forKey: .smallHdUrl)
        smallUrl = try container.decode(String.self, forKey: .smallUrl)
        thumbnailHdUrl = try container.decode(String.self, forKey: .thumbnailHdUrl)
        type = try container.decode(String.self, forKey: .type)
    }
}

extension ArticleImage: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ArticleImageKeys.self)
        try container.encode(largeHdUrl, forKey: .largeHdUrl)
        try container.encode(largeUrl, forKey: .largeUrl)
        try container.encode(mediumHdUrl, forKey: .mediumHdUrl)
        try container.encode(orderNumber, forKey: .orderNumber)
        try container.encode(smallHdUrl, forKey: .smallHdUrl)
        try container.encode(smallUrl, forKey: .smallUrl)
        try container.encode(thumbnailHdUrl, forKey: .thumbnailHdUrl)
        try container.encode(type, forKey: .type)
    }
}
