//
//  MasterCell.swift
//  client
//
//  Created by rightmeow on 2/5/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import UIKit

class MasterCell: BaseCollectionViewCell {

    var post: Post? {
        didSet {
            updateCell()
        }
    }
    let screenWidth = UIScreen.main.bounds.width
    static let cell_id = String(describing: MasterCell.self)
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    private func updateCell() {
        guard let unwrappedPost = self.post else { return }
        self.titleLabel.text = unwrappedPost.name
        self.imageView.image = UIImage(named: unwrappedPost.image_name)
    }

    private func setupCell() {
        self.backgroundColor = Color.clear
        self.containerView.backgroundColor = Color.white
        self.imageView.backgroundColor = Color.clear
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCell()
    }

}

