//
//  UITableview+Extension.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerNib(_ nibName: String, bundle: Bundle? = nil) {
        register(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: nibName)
    }

}
extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
