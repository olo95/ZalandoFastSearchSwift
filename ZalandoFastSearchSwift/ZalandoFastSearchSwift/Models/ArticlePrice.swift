//
//  ArticlePrice.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 16/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

struct ArticlePrice {
    var currency: String
    var formatted: String
    var value: Int
    
    enum ArticlePriceKeys: String, CodingKey {
        case currency
        case formatted
        case value
    }
}

extension ArticlePrice: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArticlePriceKeys.self)
        currency = try container.decode(String.self, forKey: .currency)
        formatted = try container.decode(String.self, forKey: .formatted)
        value = try container.decode(Int.self, forKey: .value)
    }
}

extension ArticlePrice: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ArticlePriceKeys.self)
        try container.encode(currency, forKey: .currency)
        try container.encode(formatted, forKey: .formatted)
        try container.encode(value, forKey: .value)
    }
}
