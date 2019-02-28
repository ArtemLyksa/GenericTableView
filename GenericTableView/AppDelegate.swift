//
//  AppDelegate.swift
//  GenericTableView
//
//  Created by Artem Lyksa on 2/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        prepare()
        return true
    }
    
    private func prepare() {
        
        let personsTVC = setupPersonTVC(items: Person.stubPersons)
        let filmsTVC = setupFilmsTVC(items: Film.stubFilms)
        
        let tabVC = UITabBarController(nibName: nil, bundle: nil)
        tabVC.setViewControllers([UINavigationController(rootViewController: personsTVC),
                                  UINavigationController(rootViewController: filmsTVC)], animated: false)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabVC
        window?.makeKeyAndVisible()
    }
    
    private func setupPersonTVC(items: [Person]) -> GenericTableViewController<Person, UITableViewCell> {
        let personsTVC = GenericTableViewController(items: items, configure: { cell, person in
            cell.textLabel?.text = person.name
        }) { [unowned self] person, sender in
            sender.navigationController?.pushViewController(self.setupFilmsTVC(items: Film.stubFilms), animated: true)
        }
        return personsTVC
    }
    
    private func setupFilmsTVC(items: [Film]) -> GenericTableViewController<Film, UITableViewCell> {
        let personsTVC = GenericTableViewController(items: items, configure: { cell, film in
            cell.textLabel?.text = film.title
            cell.detailTextLabel?.text = "\(film.releaseYear)"
        }) { [unowned self] film, sender in
            sender.navigationController?.pushViewController(self.setupPersonTVC(items: Person.stubPersons), animated: true)
        }
        return personsTVC
    }
}

