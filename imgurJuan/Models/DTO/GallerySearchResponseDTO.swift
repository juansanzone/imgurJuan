//
//  GallerySearchResponseDTO.swift
//  imgurJuan
//
//  Created by Juan sebastian Sanzone on 10/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import Foundation

struct GallerySearchResponseDTO: Codable {
    let data: [GallerySearchItemDTO]
}

struct GallerySearchItemDTO: Codable {
    let id: String
    let title: String
    let coverImageId: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case coverImageId = "cover"
    }
}
