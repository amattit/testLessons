//
//  ViewController.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 28.02.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class ViewController: UIViewController {
  
  let userService = UserService()
  var users = [User]()
  
  @IBAction func refresh(_ sender: Any) {
    userService.getUsers()
  }
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    userService.delegate = self
    userService.getUsers()
    tableView.emptyDataSetSource = self
    tableView.emptyDataSetDelegate = self
    tableView.tableFooterView = UIView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
}


// MARK: - LoanServiceDelegate

extension ViewController: UserServiceDelegate {
  func didReciveUsers(users: [User]) {
    self.users = users
    tableView.reloadData()
  }
  func didFaildWithError(error: Error) {
    
  }
}


// MARK: - UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    
        cell.name.text = users[indexPath.row].name
    
    return cell
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ToPetsController" {
      if let indexPath = tableView.indexPathForSelectedRow {
        let dc = segue.destination as! PetsViewController
        dc.userId = String(users[indexPath.row].id)
    }
  }
}
}

// MARK: - DZNEmptyDataSetDelegate

extension ViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
  
  func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
    let str = "Здравствуйте"
    let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)]
    return NSAttributedString(string: str, attributes: attrs)
  }
  
  func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
    let str = "данные загружаются"
    let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)]
    return NSAttributedString(string: str, attributes: attrs)
  }
}

