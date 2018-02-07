//
//  ContainerDetailsCell.swift
//  client
//
//  Created by rightmeow on 2/5/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import UIKit

class ContainerDetailsCell: BaseTableViewCell {

    var post: Post? {
        didSet {
            updateCell()
        }
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var leftOneLabel: UILabel!
    @IBOutlet weak var leftTwoLabel: UILabel!
    @IBOutlet weak var leftThreeLabel: UILabel!
    @IBOutlet weak var leftFourLabel: UILabel!
    @IBOutlet weak var rightOneLabel: UILabel!
    @IBOutlet weak var rightTwoLabel: UILabel!
    @IBOutlet weak var rightThreeLabel: UILabel!
    @IBOutlet weak var rightFourLabel: UILabel!

    static let cell_id = String(describing: ContainerDetailsCell.self)
    static let nibName = String(describing: ContainerDetailsCell.self)

    private func updateCell() {

    }

    private func setupCell() {
        self.titleLabel.text = "今日概述"
        self.subtitleLabel.text = "有些思考的小漩涡，可能让你忽然的放空，生活中许多的细节让你感触良多，五味杂陈，常常有时候就慢动作定格，想法在某处冻结停留，陷入一阵自我对话的沉思之中，这个时候你不喜欢被打扰或询问，也不想让某些想法曝光，个性变得有些隐晦。"
        self.leftOneLabel.text = "综合指数"
        self.leftTwoLabel.text = "幸运色"
        self.leftThreeLabel.text = "健康指数"
        self.leftFourLabel.text = "爱情指数"
        self.rightOneLabel.text = "财运指数"
        self.rightTwoLabel.text = "幸运数字"
        self.rightThreeLabel.text = "速配星座"
        self.rightFourLabel.text = "工作指数"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCell()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

}

