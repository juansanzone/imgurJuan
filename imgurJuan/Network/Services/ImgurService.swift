//
//  ImgurService.swift
//  imgurJuan
//
//  Created by Juan sebastian Sanzone on 10/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import Foundation

struct ImgurService {
    private let imageUrlService = ImageUrlService()
}

// MARK: Public methods.
extension ImgurService {
    func fetchItems(success: (([ItemViewModelProtocol])->Void)? = nil, queryToSearch: String) {

        var itemsResponse = [ItemViewModelProtocol]()

        NetworkLayer.request(router: ImgurApiRouter.gallerySearchImagesViralOfDay(queryToSearch)) { (result: Result<GallerySearchResponseDTO, Error>) in
            switch result {
            case .success(let mainResponse):
                for item in mainResponse.data {
                    itemsResponse.append(ItemViewModel(title: item.title, imageUrl: self.imageUrlService.getImageUrl(forId: item.coverImageId)))
                }
                success?(itemsResponse)
            case .failure:
                #if DEBUG
                    print(result)
                #endif
            }
        }

    }
}
