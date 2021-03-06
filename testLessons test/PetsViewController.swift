//
//  PetsViewController.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 03.03.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import UIKit

class PetsViewController: UIViewController {
  
  var pets = [Dog]()
  let petService = PetService()
  var userId : String!

  @IBOutlet weak var tableView: UITableView!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      petService.delegate = self
      petService.getPets(userId: userId)
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
    cell.name.text = pets[indexPath.row].name
    cell.birthday.text = pets[indexPath.row].birthday
    return cell
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "newPet" {
        let dc = segue.destination as! NewPetViewController
        dc.userId = userId
    }
  }
  
  @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
    
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
