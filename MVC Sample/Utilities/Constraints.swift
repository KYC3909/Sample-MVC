//
//  Constraints.swift
//  MVC Sample
//
//  Created by MERCEDES on 11/08/18.
//  Copyright © 2018 MERCEDES. All rights reserved.
//

import UIKit

class HeightContraint: NSLayoutConstraint {
    override func awakeFromNib() {
        super.awakeFromNib()
        let extraHeight = NSLayoutConstraint.getHeightIf_iPhoneX()
        self.constant = self.constant + extraHeight
    }
}
extension NSLayoutConstraint{
    class func getHeightIf_iPhoneX() -> CGFloat {
        let extraHeight = (UIScreen.main.bounds.size.height == 812) ? 24.0 : 0.0
        return CGFloat(extraHeight)
    }
}
