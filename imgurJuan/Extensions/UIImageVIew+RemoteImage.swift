//
//  UIImageVIew+RemoteImage.swift
//  imgurJuan
//
//  Created by Juan sebastian Sanzone on 10/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

// Extension to get and show remote image with simple cache.
extension UIImageView {
    func setRemoteImage(imageUrl: URL, success:((UIImage)->Void)? = nil) {
        let cache = URLCache.shared
        let request = URLRequest(url: imageUrl)
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            self.image = image
            self.backgroundColor = .clear
            success?(image)
        } else {
            self.backgroundColor = UIColor.gray
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak self] in
                        DispatchQueue.main.async {
                            self?.backgroundColor = .clear
                            self?.image = image
                        }}, completion: { _ in
                            success?(image)
                    }
                    )}
            }).resume()
        }
    }
}
