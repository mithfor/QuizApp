//
//  AppDelegate.swift
//  QuizApp
//
//  Created by Dmitrii Voronin on 16.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let viewController = ResultsViewController(summary: "You got 1/2 correct", answers: [PresentableAnswer(question: "Question??", answer: "Yeah!", wrongAnswer: nil),
        PresentableAnswer(question: "Another question??", answer: "Hell yeah!", wrongAnswer: "Hell no!")])

        _ = viewController.view
        
        viewController.tableView.allowsMultipleSelection = false
        
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }

}

