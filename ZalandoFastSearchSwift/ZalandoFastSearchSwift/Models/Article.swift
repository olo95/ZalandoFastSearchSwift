//
//  Article.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 16/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

struct Article {
    var activationDate: String
    var additionalInfos: [String]
    var ageGroups: [String]
    var attributes: [ArticleAttribute]
    var available: Bool
    var brand: ArticleBrand
    var categoryKeys: [String]
    var color: String
    var genders: [String]
    var id: String
    var media: [ArticleImage]
    var modelId: String
    var name: String
    var season: String
    var seasonYear: String
    var shopUrl: String
    var units: [ArticleUnit]
    
    enum ArticleKeys: String, CodingKey {
        case activationDate
        case additionalInfos
        case ageGroups
        case attributes
        case available
        case brand
        case categoryKeys
        case color
        case genders
        case id
        case media
        case modelId
        case name
        case season
        case seasonYear
        case shopUrl
        case units
    }
}

extension Article: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArticleKeys.self)
        activationDate = try container.decode(String.self, forKey: .activationDate)
        additionalInfos = try container.decode([String].self, forKey: .additionalInfos)
        ageGroups = try container.decode([String].self, forKey: .ageGroups)
        attributes = try container.decode([ArticleAttribute].self, forKey: .attributes)
        available = try container.decode(Bool.self, forKey: .available)
        brand = try container.decode(ArticleBrand.self, forKey: .brand)
        categoryKeys = try container.decode([String].self, forKey: .categoryKeys)
        color = try container.decode(String.self, forKey: .color)
        genders = try container.decode([String].self, forKey: .genders)
        id = try container.decode(String.self, forKey: .id)
        media = try container.decode([ArticleImage].self, forKey: .media)
        modelId = try container.decode(String.self, forKey: .modelId)
        name = try container.decode(String.self, forKey: .name)
        season = try container.decode(String.self, forKey: .season)
        seasonYear = try container.decode(String.self, forKey: .seasonYear)
        shopUrl = try container.decode(String.self, forKey: .shopUrl)
        units = try container.decode([ArticleUnit].self, forKey: .units)
    }
}

extension Article: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ArticleKeys.self)
        try container.encode(activationDate, forKey: .activationDate)
        try container.encode(additionalInfos, forKey: .additionalInfos)
        try container.encode(ageGroups, forKey: .ageGroups)
        try container.encode(attributes, forKey: .attributes)
        try container.encode(available, forKey: .available)
        try container.encode(brand, forKey: .brand)
        try container.encode(categoryKeys, forKey: .categoryKeys)
        try container.encode(color, forKey: .color)
        try container.encode(genders, forKey: .genders)
        try container.encode(id, forKey: .id)
        try container.encode(media, forKey: .media)
        try container.encode(modelId, forKey: .modelId)
        try container.encode(name, forKey: .name)
        try container.encode(season, forKey: .season)
        try container.encode(seasonYear, forKey: .seasonYear)
        try container.encode(shopUrl, forKey: .shopUrl)
        try container.encode(units, forKey: .units)
    }
}
