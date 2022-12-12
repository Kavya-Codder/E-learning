//
//  Topic.swift
//  Mansarovar
//
//  Created by Sunil Developer on 08/12/22.
//

import Foundation
struct Topics  {
    var id : Int?
    var parent_id : Int?
    var name : String?
    var alias : String?
    var num : Int?
    var status : Int?
    var details : String?
    var v_count : Int?
    var e_count : Int?
    var t_count : Int?
    var c_count : Int?
    var price : Int?
    var ori_price : Int?
    var validity : Int?
    var pay_model : String?
    var livenow : Int?
    var image : String?
    var instid : Int?

    init(response: [String: Any]) {
        self.id = response["id"] as? Int
        self.parent_id = response["parent_id"] as? Int
        self.name = response["name"] as? String
        self.alias = response["alias"] as?  String
        self.num = response["num"] as? Int
        self.status = response["status"] as? Int
        self.details = response["details"] as? String
        self.v_count = response["v_count"] as? Int
        self.e_count = response["e_count"] as? Int
        self.t_count = response["t_count"] as? Int
        self.c_count = response["c_count"] as? Int
        self.price = response["price"] as? Int
        self.ori_price = response["ori_price"] as? Int
        self.validity = response["validity"] as? Int
        self.pay_model = response["pay_model"] as? String
        self.livenow = response["livenow"] as? Int
        self.image = response["image"] as? String
        self.instid = response["instid"] as? Int
    }

       
    }


