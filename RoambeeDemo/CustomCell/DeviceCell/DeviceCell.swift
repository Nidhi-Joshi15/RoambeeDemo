//
//  DeviceCell.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 25/09/2021.
//

import UIKit

class DeviceCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(str: String) {
        labelTitle?.text = str
    }
    
}
