//
//  ArticleUnit.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 16/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

struct ArticleUnit {
    var available: Bool
    var id: String
    var originalPrice: ArticlePrice
    var price: ArticlePrice
    var size: String
    var stock: Int
    
    enum ArticleUnitKeys: String, CodingKey {
        case available
        case id
        case originalPrice
        case price
        case size
        case stock
    }
}

extension ArticleUnit: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArticleUnitKeys.self)
        available = try container.decode(Bool.self, forKey: .available)
        id = try container.decode(String.self, forKey: .id)
        originalPrice = try container.decode(ArticlePrice.self, forKey: .originalPrice)
        price = try container.decode(ArticlePrice.self, forKey: .price)
        size = try container.decode(String.self, forKey: .size)
        stock = try container.decode(Int.self, forKey: .stock)
    }
}

extension ArticleUnit: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ArticleUnitKeys.self)
        try container.encode(available, forKey: .available)
        try container.encode(id, forKey: .id)
        try container.encode(originalPrice, forKey: .originalPrice)
        try container.encode(price, forKey: .price)
        try container.encode(size, forKey: .size)
        try container.encode(stock, forKey: .stock)
    }
}
