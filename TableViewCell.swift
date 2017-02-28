//
//  TableViewCell.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 28.02.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
  @IBOutlet weak var Name: UILabel!
  @IBOutlet weak var Country: UILabel!
  @IBOutlet weak var Use: UILabel!
  @IBOutlet weak var Cost: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
