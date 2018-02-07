//
//  AppDelegate.swift
//  client
//
//  Created by rightmeow on 2/5/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import UIKit
import Amplitude
import UserNotifications
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var realmManager: RealmManager?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupRealm()
        self.setupAmplitude()
        if Configs.shared.isOnboardingCompleted() {
            print("go straight to the app")
        } else {
            print("show onboarding")
        }
        if !Configs.shared.hasDeviceToken() {
            self.setupUNUserNotificationCenterDelegate(application)
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Amplitude

    private func setupAmplitude() {
        Amplitude.instance().trackingSessionEvents = true
        Amplitude.instance().minTimeBetweenSessionsMillis = 5000
        Amplitude.instance().initializeApiKey("56951280126c1b20a76164070e7e23dd")
        Amplitude.instance().logEvent("App Start")
    }

}

extension AppDelegate: UNUserNotificationCenterDelegate {

    // MARK: - UNUserNotificationCenterDelegate

    fileprivate func setupUNUserNotificationCenterDelegate(_ application: UIApplication) {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (completed: Bool, error: Error?) in
            if let err = error {
                print(err.localizedDescription)
            } else {
                if completed == true {
                    DispatchQueue.main.async {
                        application.registerForRemoteNotifications()
                    }
                }
            }
        }
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("User Info: ", notification.request.content.userInfo)
        completionHandler([.alert, .sound, .badge])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("User Info: ", response.notification.request.content.userInfo)
        completionHandler()
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if application.applicationState == .active {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let wv = storyboard.instantiateViewController(withIdentifier: WebViewController.storyboard_id) as? WebViewController {
                let root = self.window?.rootViewController
                root?.present(wv, animated: true, completion: nil)
            }
        }
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        Configs.shared.updateDeviceToken(token: token)
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }

}

