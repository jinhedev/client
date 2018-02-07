//
//  Post.swift
//  client
//
//  Created by rightmeow on 2/5/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import Foundation

class Post: NSObject {

    var image_name: String
    var name: String

    init(image_name: String, name: String) {
        self.image_name = image_name
        self.name = name
    }

}
