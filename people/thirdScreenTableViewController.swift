//
//  thirdScreenTableViewController.swift
//  people
//
//  Created by keeheng on 16/11/2020.
//  Copyright © 2020 keeheng. All rights reserved.
//

import UIKit

class thirdScreenTableViewController: UITableViewController {
    
    var friendList: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friend List"

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "friendCell")

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendList!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)

        cell = UITableViewCell(style: .value1, reuseIdentifier: "friendCell")

        cell.textLabel?.text = friendList![indexPath.row]
        return cell
    }

   

}
