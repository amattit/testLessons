//
//  NewPetViewController.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 09.03.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import UIKit

class NewPetViewController: UIViewController {

  @IBOutlet weak var petImage: UIImageView!
  @IBOutlet weak var petName: UITextField!
  @IBOutlet weak var petBirthday: UITextField!
  @IBOutlet weak var petDescription: UITextField!
  var userId : String!
  let petService = PetService()
    override func viewDidLoad() {
        super.viewDidLoad()
      petService.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 */
   @IBAction func cancel(_ sender: UIBarButtonItem) {
   }
 
  @IBAction func savePet(_ sender: UIBarButtonItem) {
    petService.newPet(userId: userId, name: petName.text!, birthday: petBirthday.text!, descriptions: petDescription.text!)
  }
  
}
extension NewPetViewController: PetServiceDelegate {
  func didRecivePets(pets: [Dog]) {
    //
  }
  
  func didFaildWithError(error: Error) {
    //
  }
}
