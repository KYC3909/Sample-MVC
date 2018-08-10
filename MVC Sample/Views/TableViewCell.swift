//
//  TableViewCell.swift
//  MVC Sample
//
//  Created by MERCEDES on 11/08/18.
//  Copyright © 2018 MERCEDES. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbl: UILabel!
    override func awakeFromNib() { super.awakeFromNib()
    }
    
    func setupCell(_ item : Any?){
        lbl.text = "Row : NO MODEL?STRUCT provided"
        if let item = item as? RowModelClass {
            lbl.text = item.rowTitle
        }else if let item = item as? RowModelStruct {
            lbl.text = item.rowTitle
        }
    }
}
