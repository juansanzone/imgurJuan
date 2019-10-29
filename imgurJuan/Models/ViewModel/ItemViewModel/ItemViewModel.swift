//
//  ItemViewModel.swift
//  imgurJuan
//
//  Created by Juan sebastian Sanzone on 10/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import Foundation

final class ItemViewModel {
    let titleStr: String
    let imageUrlStr: String

    init(title: String, imageUrl: String) {
        self.titleStr = title
        self.imageUrlStr = imageUrl
    }
}

// ItemViewModelProtocol implementation.
extension ItemViewModel: ItemViewModelProtocol {
    func title() -> String {
        return titleStr
    }

    func imageUrl() -> URL? {
        return URL(string: imageUrlStr)
    }
}
