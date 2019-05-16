//
//  HistoryController.swift
//  ML Project
//
//  Created by Ugo Dos Reis on 5/8/19.
//  Copyright © 2019 Abhinav Pappu. All rights reserved.
//

import UIKit

class HistoryController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var history: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = String(history[indexPath.item])
        return cell
    }
}
