//
//  MasterViewController.swift
//  client
//
//  Created by rightmeow on 2/5/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import UIKit
import Amplitude

class MasterViewController: BaseViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: - API

    var posts: [Post] = [
        Post(image_name: "aquarius", name: "水瓶座"),
        Post(image_name: "aries", name: "白羊座"),
        Post(image_name: "cancer", name: "巨蟹座"),
        Post(image_name: "capricorn", name: "摩羯座"),
        Post(image_name: "gemini", name: "双子座"),
        Post(image_name: "leo", name: "狮子座"),
        Post(image_name: "libra", name: "天秤座"),
        Post(image_name: "pisces", name: "双鱼座"),
        Post(image_name: "sagittarius", name: "射手座"),
        Post(image_name: "scorpio", name: "天蠍座"),
        Post(image_name: "taurus", name: "金牛座"),
        Post(image_name: "virgo", name: "處女座")
    ]
    var webServiceManager: WebServiceManager?
    let collectionViewMargin: CGFloat = 32
    private let screenWidth = UIScreen.main.bounds.width
    static let storyboard_id = String(describing: MasterViewController.self)
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUICollectionView()
        self.setupUICollectionViewDelegate()
        self.setupUICollectionViewDataSource()
        self.setupUICollectionViewDelegateFlowLayout()
        // initial actions
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let selectedIndex = self.collectionView.indexPathsForSelectedItems?.first {
            let selectedPost = self.posts[selectedIndex.item]
            if segue.identifier == Segue.ConstellationsViewControllerToDetailsViewController {
                if let destinationViewController = segue.destination as? DetailsViewController {
                    destinationViewController.selectedPost = selectedPost
                }
            }
        }
    }

    // MAKR: - UICollectionView

    private func setupUICollectionView() {
        self.collectionView.contentInset = UIEdgeInsets(top: collectionViewMargin, left: collectionViewMargin, bottom: collectionViewMargin, right: collectionViewMargin)
        self.collectionView.backgroundColor = Color.white
    }

    // MARK: - UICollectionViewDelegate

    private func setupUICollectionViewDelegate() {
        self.collectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: Segue.ConstellationsViewControllerToDetailsViewController, sender: self)
    }

    // MARK: - UICollectionViewDataSource

    private func setupUICollectionViewDataSource() {
        self.collectionView.dataSource = self
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.posts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MasterCell.cell_id, for: indexPath) as? MasterCell {
            cell.post = self.posts[indexPath.item]
            return cell
        } else {
            return BaseCollectionViewCell()
        }
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    private func setupUICollectionViewDelegateFlowLayout() {
        self.collectionViewFlowLayout.scrollDirection = .vertical
        self.collectionViewFlowLayout.minimumInteritemSpacing = 16
        self.collectionViewFlowLayout.minimumLineSpacing = collectionViewMargin
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = ((screenWidth - (2 * collectionViewMargin)) / 3) - (collectionViewMargin / 2)
        let cellHeight = cellWidth + 32
        return CGSize(width: cellWidth, height: cellHeight)
    }

}

