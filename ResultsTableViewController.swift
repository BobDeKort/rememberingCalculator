//
//  ResultsTableViewController.swift
//  rememberingCalculator
//
//  Created by Bob De Kort on 11/16/16.
//  Copyright © 2016 Bob De Kort. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    var calcualtionsArray: [String] = []{
        didSet{
            tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return calcualtionsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calculationCell")
        cell?.textLabel?.text = calcualtionsArray[indexPath.row]
        return cell!
    }
}
