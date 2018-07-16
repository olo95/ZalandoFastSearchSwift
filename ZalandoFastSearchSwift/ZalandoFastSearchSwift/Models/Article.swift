//
//  Article.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 16/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

struct Article: Codable {
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
}
