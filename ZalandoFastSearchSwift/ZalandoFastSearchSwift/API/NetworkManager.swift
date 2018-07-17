//
//  NetworkManager.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 17/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() { }
    
    lazy var baseUrl: URL? = {
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"), let plistDict = NSDictionary(contentsOfFile: path), let baseUrlString = plistDict["baseUrl"] as? String else { return nil }
        return URL(string: baseUrlString)
    }()
    
    
}
