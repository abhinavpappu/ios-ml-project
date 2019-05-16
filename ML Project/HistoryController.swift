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
    struct Item {
        var text:String
        var image:UIImage
    }
    var history: [Item] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! HistoryCell
        cell.scoreLabel.text = history[indexPath.item].text
        cell.imageView.image = history[indexPath.item].image
        return cell
    }
}
