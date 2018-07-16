//
//  ArticleAttribute.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 16/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

struct ArticleAttribute {
    var name: String
    var values: [String]
    
    enum ArticleAttributeKeys: String, CodingKey {
        case name
        case values
    }
}

extension ArticleAttribute: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArticleAttributeKeys.self)
        name = try container.decode(String.self, forKey: .name)
        values = try container.decode([String].self, forKey: .values)
    }
}

extension ArticleAttribute: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ArticleAttributeKeys.self)
        try container.encode(name, forKey: ArticleAttributeKeys.name)
        try container.encode(values, forKey: ArticleAttributeKeys.values)
    }
}
