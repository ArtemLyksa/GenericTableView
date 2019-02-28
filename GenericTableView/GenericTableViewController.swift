//
//  GenericTableViewController.swift
//  GenericTableView
//
//  Created by Artem Lyksa on 2/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import UIKit

@objcMembers
class GenericTableViewController<T, Cell: UITableViewCell>: UITableViewController {

    var items: [T]
    var configure: (Cell, T) -> Void
    var selectHandler: (T, UIViewController) -> Void
    
    init(items: [T], configure: @escaping (Cell, T) -> Void, selectHandler: @escaping (T, UIViewController) -> Void) {
        self.items = items
        self.configure = configure
        self.selectHandler = selectHandler
        super.init(style: .plain)
        self.tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
        self.tableView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let item = items[indexPath.row]
        configure(cell, item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        selectHandler(item, self)
    }
}

