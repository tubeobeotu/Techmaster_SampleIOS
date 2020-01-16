//
//  ItemFeedsCell.swift
//  UITableView
//
//  Created by Nguyễn Văn Tú on 1/16/20.
//  Copyright © 2020 Nguyễn Văn Tú. All rights reserved.
//

import UIKit

class ItemFeedsCell: UITableViewCell {
    @IBOutlet weak var lbl_Content: UILabel!
    static let maxLines = 6
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func expand(_ sender: Any) {
    }
    
}
