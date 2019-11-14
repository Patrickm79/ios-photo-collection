//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Patrick Millet on 11/14/19.
//  Copyright © 2019 Patrick Millet. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    private func create(_ newPhoto: Photo) {
        photos.append(newPhoto)
    }
    
    private func Update(photo: Photo, data: Data, name: String){
        
    }
}
