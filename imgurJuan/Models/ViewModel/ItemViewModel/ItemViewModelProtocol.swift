//
//  ItemViewModelProtocol.swift
//  imgurJuan
//
//  Created by Juan sebastian Sanzone on 10/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import Foundation

protocol ItemViewModelProtocol {
    func title() -> String
    func imageUrl() -> URL?
}
