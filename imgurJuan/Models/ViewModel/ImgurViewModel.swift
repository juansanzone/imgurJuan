//
//  ImgurViewModel.swift
//  imgurJuan
//
//  Created by Juan sebastian Sanzone on 10/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import Foundation

final class ImgurViewModel {
    private var items: [ItemViewModelProtocol] = [ItemViewModelProtocol]()
    private let imgurService = ImgurService()
}

// MARK: Public methods.
extension ImgurViewModel {
    func fetchItems(success: ((Bool)->Void)? = nil) {
        imgurService.getItems { [weak self] response in
            self?.items = response
            success?(response.count > 0)
        }
    }

    func getItems() -> [ItemViewModelProtocol] {
        return items
    }

    func getItemsCount() -> Int {
        return items.count
    }
}
