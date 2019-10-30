//
//  ImgurApiRouter.swift
//  imgurJuan
//
//  Created by Juan sebastian Sanzone on 10/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import Foundation

enum ImgurApiRouter {
    case gallerySearchImagesViralOfDay(String)

    var clientId: String {
        return "Client-ID cf7c2a54bdcbefe"
    }

    var scheme: String {
        return "https"
    }

    var host: String {
        return "api.imgur.com"
    }

    var path: String {
        switch self {
        case .gallerySearchImagesViralOfDay:
            return "/3/gallery/search/viral/day/1"
        }
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .gallerySearchImagesViralOfDay(let tagToSearch):
            return [
                URLQueryItem(name: "q", value: tagToSearch),
                URLQueryItem(name: "q_type", value: "jpg"),
                URLQueryItem(name: "q_size_px", value: "small")
            ]
        }
    }

    var method: String {
        switch self {
        case .gallerySearchImagesViralOfDay:
            return "GET"
        }
    }
}
