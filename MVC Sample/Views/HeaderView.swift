//
//  HeaderView.swift
//  MVC Sample
//
//  Created by MERCEDES on 11/08/18.
//  Copyright © 2018 MERCEDES. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    //MARK: - IBOutlet Vars
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnRefresh: UIButton!
    var btnRefreshSelect:((UIButton?) -> Void)? = nil
    
    //MARK: - init & Setup
    var nibName:String = ""
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        nibName = String(describing: type(of: self))
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(self.contentView)
        self.contentView.frame = bounds
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = bounds
    }
    
    //#MARK:- UISearchBarDelegate
    @IBAction func btnRefreshSelected(_ sender: UIButton) {
        self.btnRefreshSelect?(sender)
    }
    
    
}
