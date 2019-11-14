//
//  Photo.swift
//  PhotoCollection
//
//  Created by Patrick Millet on 11/14/19.
//  Copyright © 2019 Patrick Millet. All rights reserved.
//

import Foundation

struct Photo: Equatable, Codable {
    var imageData: Data
    var title: String
    
}

extension String {
    static let themeKey = "themeKey"
}
