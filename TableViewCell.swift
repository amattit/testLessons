//
//  TableViewCell.swift
//  testLessons test
//
//  Created by Mikhail Seregin on 28.02.17.
//  Copyright © 2017 Mikhail Seregin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var country: UILabel!
  @IBOutlet weak var use: UILabel!
  @IBOutlet weak var cost: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
}
