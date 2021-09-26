//
//  DataCell.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 25/09/2021.
//

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel?
    
    @IBOutlet weak var labelDetail: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(data: DataModel?) {
        labelTitle?.text = data?.dataTitle
        labelTitle?.sizeToFit()
        labelDetail?.text = data?.details
        labelDetail?.sizeToFit()
    }
    
}
