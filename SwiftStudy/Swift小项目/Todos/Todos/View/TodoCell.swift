//
//  TodoCell.swift
//  Todos
//
//  Created by zainguo on 2019/5/21.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var checkLab: UILabel!
    @IBOutlet weak var todoLab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
