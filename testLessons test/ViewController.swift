//
//  ViewController.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 28.02.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let loanService = LoanService()
  var loans: [Loan]?
  
  @IBOutlet weak var cleanView: UIView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var isLoadView: UIActivityIndicatorView!
  override func viewDidLoad() {
    super.viewDidLoad()
    loanService.delegate = self
    loanService.getLoans()
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
    if loans == nil {
      return 0
    } else {
      cleanView.isHidden = true
      isLoadView.isHidden = true
      return loans!.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    
        cell.Name.text = loans?[indexPath.row].name
        cell.Cost.text = String(describing: loans?[indexPath.row].cost)
        cell.Country.text = loans?[indexPath.row].country
        cell.Use.text = loans?[indexPath.row].use
    
    return cell
  }
  
  
}

