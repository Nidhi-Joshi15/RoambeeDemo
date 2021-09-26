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
