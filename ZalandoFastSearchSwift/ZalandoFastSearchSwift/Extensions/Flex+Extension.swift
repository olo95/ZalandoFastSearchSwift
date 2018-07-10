//
//  Flex+Extension.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 10/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import class FlexLayout.Flex
import struct UIKit.CGSize
import struct UIKit.CGFloat

extension Flex {
    func shadow(shadowOffset: CGSize, shadowOpacity: Float, shadowRadius: CGFloat) -> Flex {
        view?.layer.shadowOffset = shadowOffset
        view?.layer.shadowOpacity = shadowOpacity
        view?.layer.shadowRadius = shadowRadius
        return self
    }
}
