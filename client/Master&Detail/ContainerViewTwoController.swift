//
//  ContainerViewTwoController.swift
//  horoscopeclient
//
//  Created by rightmeow on 2/1/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import UIKit

class ContainerViewTwoController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    private func setupUITableView() {
        self.tableView.register(UINib(nibName: ContainerDetailsCell.nibName, bundle: nil), forCellReuseIdentifier: ContainerDetailsCell.cell_id)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUITableView()
        self.setupUITableViewDataSource()
        self.setupUITableViewDelegate()
    }

}

extension ContainerViewTwoController: UITableViewDelegate {

    private func setupUITableViewDelegate() {
        self.tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // do nothing
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}

extension ContainerViewTwoController: UITableViewDataSource {

    private func setupUITableViewDataSource() {
        self.tableView.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: ContainerDetailsCell.cell_id, for: indexPath) as? ContainerDetailsCell {
            cell.titleLabel.text = "今月概述"
            return cell
        } else {
            return BaseTableViewCell()
        }
    }

}
