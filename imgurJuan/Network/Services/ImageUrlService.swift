//
//  ImageUrlService.swift
//  imgurJuan
//
//  Created by Juan sebastian Sanzone on 10/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import Foundation

struct ImageUrlService {
    func getImageUrl(forId: String?) -> String {
        guard let key = forId else { return "" }
        return "https://i.imgur.com/\(key).jpg"
    }
}
