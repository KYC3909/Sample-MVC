//
//  Model.swift
//  MVC Sample
//
//  Created by MERCEDES on 11/08/18.
//  Copyright © 2018 MERCEDES. All rights reserved.
//

import UIKit

class RowModelClass: NSObject {
    var rowTitle : String?
    init(rowTitle : String) {
        self.rowTitle = rowTitle
    }
}

struct RowModelStruct {
    var rowTitle : String?
}

func createAnArray() -> [Any]? {
    var array = [Any]()
    for i in 0..<20 {
        if i % 2 == 0{
            array.append(RowModelClass(rowTitle : "Row Model : \(i+1)"))
        }else{
            array.append(RowModelStruct(rowTitle : "Row Struct : \(i+1)"))
        }
    }
    return array
}
