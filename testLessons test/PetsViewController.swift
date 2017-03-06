//
//  PetsViewController.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 03.03.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class PetsViewController: UIViewController {
  
  var pets = [Dog]()
  let petService = PetService()
  var userId : String!

  @IBOutlet weak var tableView: UITableView!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      petService.delegate = self
      petService.getPets(userId: userId)
      tableView.emptyDataSetSource = self
      tableView.emptyDataSetDelegate = self
      tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}

extension PetsViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pets.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PetsTableViewCell
    
    cell.textLabel?.text = pets[indexPath.row].name
    
    return cell
  }
  
}

extension PetsViewController: PetServiceDelegate {
  
  func didRecivePets(pets: [Dog]) {
    self.pets = pets
    tableView.reloadData()
  }
  
  func didFaildWithError(error: Error) {
    print(error)
  }
  
}

extension PetsViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
  
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
