//
//  ImgurService.swift
//  imgurJuan
//
//  Created by Juan sebastian Sanzone on 10/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import Foundation

struct ImgurService {
}

// MARK: Public methods.
extension ImgurService {
    func getItems(success: (([ItemViewModelProtocol])->Void)? = nil) {

        // TODO: Network API call with DTOs

        var mockResponse: [ItemViewModelProtocol] = [ItemViewModelProtocol]()

        let mock1 = ItemViewModel(title: "image 1 mock title", imageUrl: "https://images-na.ssl-images-amazon.com/images/I/81bNkM6hDnL._SX466_.jpg")
        mockResponse.append(mock1)

        let mock2 = ItemViewModel(title: "image 2 mock title", imageUrl: "https://auto.ndtvimg.com/car-images/big/ferrari/portofino/ferrari-portofino.jpg?v=27")
        mockResponse.append(mock2)

        let mock3 = ItemViewModel(title: "image 3 mock title", imageUrl: "https://cinthiasa.com/wp-content/uploads/2016/09/4-401_Cars_Race_prn.jpg")
        mockResponse.append(mock3)

        let mock4 = ItemViewModel(title: "image 4 mock title", imageUrl: "https://static.carsdn.co/cldstatic/wp-content/uploads/Jeep_art-final.jpg")
        mockResponse.append(mock4)

        success?(mockResponse)
    }
}
