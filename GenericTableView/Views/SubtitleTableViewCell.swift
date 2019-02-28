//
//  SubtitleTableViewCell.swift
//  GenericTableView
//
//  Created by Artem Lyksa on 2/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import UIKit

class SubtitleTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
