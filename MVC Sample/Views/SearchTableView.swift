//
//  SearchTableView.swift
//  MVC Sample
//
//  Created by MERCEDES on 11/08/18.
//  Copyright © 2018 MERCEDES. All rights reserved.
//

import UIKit

protocol SearchTableViewDelegate {
    func didEnteredSearchText(searchBarText : String, inSearchTableView : SearchTableView)
    func didSelectRow(indexPath : IndexPath, inSearchTableView : SearchTableView)
}

class SearchTableView: UIView, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    //MARK: - IBOutlet Vars
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var searchView: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: SearchTableViewDelegate?
    var arrayItems : [Any]?
    
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
        
        tableView.register(UINib.init(nibName: "TableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = bounds
    }
    
    //#MARK:- UISearchBarDelegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        self.delegate?.didEnteredSearchText(searchBarText: searchBar.text!, inSearchTableView: self)
    }
    //#MARK:- UITableViewDataSource
    func provideAnArrayThenReloadArray(array : [Any]?) {
        self.arrayItems = array
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayItems?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let item = self.arrayItems![indexPath.row]
        cell.setupCell(item)
        return cell
    }
    //#MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectRow(indexPath: indexPath, inSearchTableView: self)
    }
}
