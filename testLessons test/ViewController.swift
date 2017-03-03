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
  
  let loanService = LoanService()
  var loans = [Loan]()
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    loanService.delegate = self
    loanService.getLoans()
    tableView.emptyDataSetSource = self
    tableView.emptyDataSetDelegate = self
    tableView.tableFooterView = UIView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
}


// MARK: - LoanServiceDelegate

extension ViewController: LoanServiceDelegate {
  func didReciveLoans(loans: [Loan]) {
    self.loans = loans
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
      return loans.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    
        cell.name.text = loans[indexPath.row].name
        cell.cost.text = String(describing: loans[indexPath.row].cost)
        cell.country.text = loans[indexPath.row].country
        cell.use.text = loans[indexPath.row].use
    
    return cell
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
  
  func loadActivity(forEmptyDataSet scrollView: UIScrollView) -> UIView {
    let loadActivity = UIActivityIndicatorView(frame: view.frame)
    loadActivity.center = view.center
    loadActivity.startAnimating()
    scrollView.addSubview(loadActivity)
    return loadActivity
  }
  
}

