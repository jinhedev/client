//
//  ContainerViewOneController.swift
//  horoscopeclient
//
//  Created by rightmeow on 2/1/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import UIKit

class ContainerViewOneController: BaseViewController {

    // MARK: - API

    @IBOutlet weak var tableView: UITableView!

    // MARK: - UITableView

    private func setupUITableView() {
        self.tableView.register(UINib(nibName: ContainerDetailsCell.nibName, bundle: nil), forCellReuseIdentifier: ContainerDetailsCell.cell_id)
    }


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUITableView()
        self.setupUITableViewDelegate()
        self.setupUITableViewDataSource()
    }

}

extension ContainerViewOneController: UITableViewDelegate {

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

extension ContainerViewOneController: UITableViewDataSource {

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
            cell.titleLabel.text = "今日概述"
            return cell
        } else {
            return BaseTableViewCell()
        }
    }

}
