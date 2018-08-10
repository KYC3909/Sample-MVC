//
//  ViewController.swift
//  MVC Sample
//
//  Created by MERCEDES on 11/08/18.
//  Copyright © 2018 MERCEDES. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SearchTableViewDelegate {
    
    var arrayItems : [Any]?
    
    @IBOutlet weak var searchTableView: SearchTableView!
    @IBOutlet weak var headerView: HeaderView!

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
    }
    func layoutViews() {
        self.arrayItems = createAnArray()
        
        self.searchTableView.delegate = self
        self.searchTableView.provideAnArrayThenReloadArray(array: arrayItems)
        
        headerView.btnRefreshSelect = { (btnRefresh) in
            self.arrayItems?.removeAll()
            self.searchTableView.provideAnArrayThenReloadArray(array: self.arrayItems)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.arrayItems = createAnArray()
                self.searchTableView.provideAnArrayThenReloadArray(array: self.arrayItems)
            }
        }
    }
    //#MARK:- SearchTableViewDelegate
    func didEnteredSearchText(searchBarText : String, inSearchTableView : SearchTableView){
        print("searchBarText \(searchBarText)")
    }
    func didSelectRow(indexPath : IndexPath, inSearchTableView : SearchTableView){
        print("indexPath \(indexPath)")
    }

}

