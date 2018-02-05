//
//  Constants.swift
//  horoscopeclient
//
//  Created by rightmeow on 1/30/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import Foundation

let kOnboardingCompletion = "kOnboardingCompletion"
let kSessionToken = "kSessionToken"
let kDeviceToken = "kDeviceToken" // whether or not a deviceToken exists in Keychain
let kApiKey = "kApiKey" // whether or not a apiKey exists in Keychain

struct KeychainConfiguration {
    static let serviceName = "horoscopeclient"
    static let account = "horoscopeclient_device_token"
    static let accessGroup: String? = Bundle.main.bundleIdentifier!
}

struct WebServiceConfiguration {
    private let baseUrl = "http://web.juhe.cn:8080/constellation"
    static let key = "key"
    static let consName = "consName"
    static let type = "type"
}

struct Segue {
    static let ConstellationsViewControllerToDetailsViewController = "ConstellationsViewControllerToDetailsViewController"
}
