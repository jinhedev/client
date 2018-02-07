//
//  DetailsViewController.swift
//  client
//
//  Created by rightmeow on 2/5/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import UIKit

class DetailsViewController: BaseViewController {

    var selectedPost: Post?
    static let storyboard_id = String(describing: DetailsViewController.self)
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var constellationImageView: UIImageView!
    @IBOutlet weak var constellationTitleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerViewOne: UIView!
    @IBOutlet weak var containerViewTwo: UIView!
    @IBOutlet weak var containerViewThree: UIView!

    // MARK: - HeaderView

    private func setupHeaderView() {
        self.headerView.backgroundColor = Color.specialPurple
        guard let post = self.selectedPost else { return }
        self.constellationImageView.backgroundColor = Color.clear
        self.constellationImageView.image = UIImage(named: post.image_name)
        self.constellationTitleLabel.text = post.name
        self.subtitleLabel.text = "2014年06月27日"
    }

    // MARK: - SegmentedControl

    private func setupSegmentedControl() {
        self.segmentedControl.selectedSegmentIndex = 0
    }

    @IBAction func segmentedControl_tapped(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerViewOne.alpha = 1
                self.containerViewTwo.alpha = 0
                self.containerViewThree.alpha = 0
            })
        } else if sender.selectedSegmentIndex == 1 {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerViewOne.alpha = 0
                self.containerViewTwo.alpha = 1
                self.containerViewThree.alpha = 0
            })
        } else if sender.selectedSegmentIndex == 2 {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerViewOne.alpha = 0
                self.containerViewTwo.alpha = 0
                self.containerViewThree.alpha = 1
            })
        }
    }

    // MARK: - UINavigationController

    private func setupUINavigationBar() {
        self.navigationController?.navigationBar.barTintColor = Color.specialPurple
        self.navigationController?.navigationBar.isTranslucent = false
    }

    @IBAction func shareButton_tapped(_ sender: UIBarButtonItem) {
        let activityItem = "看\(self.selectedPost!.name)运势，请用千千星运！"
        let activityViewController = UIActivityViewController(activityItems: [activityItem], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Color.specialPurple
        self.setupUINavigationBar()
        self.setupHeaderView()
        self.setupSegmentedControl()
        // initial alpha state for containerViews
        self.containerViewOne.alpha = 1
        self.containerViewTwo.alpha = 0
        self.containerViewThree.alpha = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

}


