//
//  PetsTableViewCell.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 03.03.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import UIKit

class PetsTableViewCell: UITableViewCell {

  @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  @IBOutlet weak var birthday: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
