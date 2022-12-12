//
//  SubjectsModel.swift
//  Mansarovar
//
//  Created by Sunil Developer on 06/12/22.
//

struct SubjectModel  {
    var subject_id : Int?
    var parent_id : Int?
    var subject_name : String?
    var subject_alias : String?
    var num : Int?
    var status : Int?
    var mix : Int?
    var mob_publish : Int?
    var mobile_logo_path : String?
    var details : String?
    var exam_id : Int?
    var instid : Int?
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
    
    init(respnse: [String: Any]) {
        
        self.subject_id = respnse["subject_id"] as? Int
        self.parent_id = respnse["parent_id"] as? Int
        self.subject_name = respnse["subject_name"] as? String
        self.subject_alias = respnse["subject_alias"] as? String
        self.num = respnse["num"] as? Int
        self.status = respnse["status"] as? Int
        self.mix = respnse["mix"] as? Int
        self.mob_publish = respnse["mob_publish"] as? Int
        self.mobile_logo_path = respnse["mobile_logo_path"] as? String
        self.details = respnse["details"] as? String
        self.exam_id = respnse["exam_id"] as? Int
        self.instid = respnse["instid"] as? Int
        self.v_count = respnse["v_count"] as? Int
        self.e_count = respnse["e_count"] as? Int
        self.t_count = respnse["t_count"] as? Int
        self.c_count = respnse["c_count"] as? Int
        self.price = respnse["price"] as? Int
        self.ori_price = respnse["ori_price"] as? Int
        self.validity = respnse["validity"] as? Int
        self.pay_model = respnse["pay_model"] as? String
        self.livenow = respnse["livenow"] as? Int
        self.image = respnse["image"] as? String
    }
        
    }
