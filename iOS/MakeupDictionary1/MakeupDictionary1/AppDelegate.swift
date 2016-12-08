//
//  AppDelegate.swift
//  MakeupDictionary1
//
//  Created by Angela Delise on 11/29/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit

var selectedRow = 1;
var sectionNumber = 0;

var terms = [
             ["Fallout", "When eyeshadow falls from the eye onto the undereye or cheek area. Typically occurs with powdery shadows and glitters. This can be prevented with an eyeshadow shield.", "foundation.jpg", "Elf", "Maybelline Smokey", "Urban Decay"],
             ["Flashback", "When flash photography creates a white cast on the face. This is due to the pigments of a foundation or powder that contain SPF.", "foundation.jpg"],
             ["Oxidation", "This occurs when a foundation color darkens after it is applied. Usually creating an orange and darker tint to the skin, when the liquid of the foundation react with the air.", "concealer.jpg"]
             ]

var techniques = [
             ["Baking", "A technique used to set the concealer of the undereye area by placing an excessive amount of translucent loose powder to the face. Place the powder onto the face for several minutes and then wipe it away with a powder brush.", "concealer.jpg"],
             ["Color Correcting", "provides more coverage in one area of the face", "concealer.jpg"],
             ["Contouring", "is used to set the face", "concealer.jpg"],
             ["Highlighting", "is used to set the face", "concealer.jpg"],
             ["Overlining", "is used to set the face", "concealer.jpg"],
             ["Strobing", "is used to set the face", "concealer.jpg"],
             ["Setting", "is used to set the face", "concealer.jpg"]
            ]

var products = [["Foundation", "A foundation is makeup that serves as a base"],
             ["Concealer", "provides more coverage in one area of the face"],
             ["Powder", "is used to set the face"],
            ["Eyeshadow", "put on eyelids"],
            ["Eyeliner", "Liquid, gel or pencil that is used to create sharp lines on the face. Typically placed above the eye to create a wing or cat eye effect."],
            ["Mascara", "Tube of product typically sold in black and brown that is placed on the lashes to increase length and volume."],
            ["Eyeshadow", "put on eyelids", "foundation.jpg", "Maybelline Smokey", "Urban Decay", "Skin"],
            ["Eyeshadow", "put on eyelids"],
            ["Eyeshadow", "put on eyelids"],
            ["Eyeshadow", "put on eyelids"],
            ["Eyeshadow", "put on eyelids"],
            ["Eyeshadow", "put on eyelids"]]

var tools = [["Beauty Blendr", "A foundation is makeup that serves as a base"],
             ["Eyelash Curler", "provides more coverage in one area of the face"],
             ["Lash Guard", "is used to set the face"],
             ["Kabuki Brush", "is used to set the face"]]


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
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

    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

}

