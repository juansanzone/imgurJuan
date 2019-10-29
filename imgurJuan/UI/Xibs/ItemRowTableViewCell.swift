//
//  ItemRowTableViewCell.swift
//  imgurJuan
//
//  Created by Juan sebastian Sanzone on 10/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

final class ItemRowTableViewCell: UITableViewCell {
    static let reuseIdentifier: String = "itemRowCell"
    static let xibName: String = "ItemRowTableViewCell"

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        itemImage.image = nil
    }
}

// MARK: Setup cell.
extension ItemRowTableViewCell {
    func setupCell(modelProtocol: ItemViewModelProtocol) {
        itemLabel.text = modelProtocol.title()
        if let imageUrl = modelProtocol.imageUrl() {
            itemImage.setRemoteImage(imageUrl: imageUrl, success: nil)
        }
    }
}
