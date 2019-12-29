//
//  ViewController.swift
//  NSAttributedString
//
//  Created by fuyoufang on 2019/12/29.
//  Copyright © 2019 fuyoufang. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private var attributedStrings = [NSAttributedString]()
    private let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        let htmlString = """
        RxSwift 的相关项目有<a href="https://github.com/devxoul/Drrrible">Drrrible</a>、<a href="https://github.com/devxoul/RxTodo">RxTodo</a>
        """
        if let attributedString = try? NSAttributedString.init(htmlString: htmlString) {
            attributedStrings.append(attributedString)
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attributedStrings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        cell.textLabel?.attributedText = attributedStrings[indexPath.row]
        return cell
    }
}

