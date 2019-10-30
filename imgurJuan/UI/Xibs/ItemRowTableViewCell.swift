//
//  ItemRowTableViewCell.swift
//  imgurJuan
//
//  Created by Juan sebastian Sanzone on 10/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit
import SDWebImage

final class ItemRowTableViewCell: UITableViewCell {
    static let reuseIdentifier: String = "itemRowCell"
    static let xibName: String = "ItemRowTableViewCell"

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!

    private let placeHolderImage = UIImage(named: "placeholder")

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
        itemImage.sd_setImage(with: modelProtocol.imageUrl(), placeholderImage: placeHolderImage, options: .scaleDownLargeImages)
    }
}
