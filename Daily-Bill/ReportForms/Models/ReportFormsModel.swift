//
//  ReportFormsModel.swift
//  Daily-Bill
//
//  Created by Jackey on 2022/05/10.
//

import UIKit

class ReportFormsModel: NSObject {

    var consumeType: ConsumeType?
    var title: String{
        get{
            return consumeType?.keyName ?? ""
        }
    }
    var amount: String{
        get{
            return consumeType?.keyValue ?? ""
        }
    }
    var count: Int64{
        get{
            return consumeType?.count ?? 0
        }
    }
    
    var scale: Double = 0.00
    var type: NSInteger = 1 //1: 支出， 2：收入
    

}
