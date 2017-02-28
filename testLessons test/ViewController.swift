//
//  ViewController.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 28.02.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var loans = [Loan(name: "Михаил", country: "Россия", use:"На бухло", cost: 2000), Loan(name: "Немихаил", country: "Россия", use:"Не на бухло", cost: 2000), Loan(name: "Артур", country: "Россия", use:"На новую компанию", cost: 202200), Loan(name: "Александр", country: "Россия", use:"На новую импрезу 5", cost: 202200000), Loan(name: "Сашка", country: "Россия", use:"Хочу мак бук про 2020 года", cost: 202200)]
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
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
    
    cell.Name.text = loans[indexPath.row].name
    cell.Cost.text = String(loans[indexPath.row].cost)
    cell.Country.text = loans[indexPath.row].country
    cell.Use.text = loans[indexPath.row].use
    
    return cell
  }
  
  
}

