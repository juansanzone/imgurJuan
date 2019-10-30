//
//  ViewController+TableView.swift
//  imgurJuan
//
//  Created by Juan sebastian Sanzone on 10/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit
import INSPhotoGallery

// MARK: TableView protocols.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getItemsCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let targetCell = tableView.dequeueReusableCell(withIdentifier: ItemRowTableViewCell.reuseIdentifier, for: indexPath) as? ItemRowTableViewCell {
            let targetItemModel = viewModel.getItems()[indexPath.row]
            targetCell.setupCell(modelProtocol: targetItemModel)
            return targetCell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > viewModel.getItemsCount() { return }
        if let tappedCell = tableView.cellForRow(at: indexPath) as? ItemRowTableViewCell {
            let photo = INSPhoto(image: tappedCell.itemImage.image, thumbnailImage: nil)
            let photos: [INSPhotoViewable] = [photo]
            let galleryPreview = INSPhotosViewController(photos: photos, initialPhoto: photo, referenceView: tappedCell)
            present(galleryPreview, animated: true, completion: nil)
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
}
