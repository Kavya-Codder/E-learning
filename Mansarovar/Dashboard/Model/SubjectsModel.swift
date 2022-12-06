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
    
    init(respnce: [String: Any]) {
        
        self.subject_id = respnce["subject_id"] as? Int
        self.parent_id = respnce["parent_id"] as? Int
        self.subject_name = respnce["subject_name"] as? String
        self.subject_alias = respnce["subject_alias"] as? String
        self.num = respnce["num"] as? Int
        self.status = respnce["status"] as? Int
        self.mix = respnce["mix"] as? Int
        self.mob_publish = respnce["mob_publish"] as? Int
        self.mobile_logo_path = respnce["mobile_logo_path"] as? String
        self.details = respnce["details"] as? String
        self.exam_id = respnce["exam_id"] as? Int
        self.instid = respnce["instid"] as? Int
        self.v_count = respnce["v_count"] as? Int
        self.e_count = respnce["e_count"] as? Int
        self.t_count = respnce["t_count"] as? Int
        self.c_count = respnce["c_count"] as? Int
        self.price = respnce["price"] as? Int
        self.ori_price = respnce["ori_price"] as? Int
        self.validity = respnce["validity"] as? Int
        self.pay_model = respnce["pay_model"] as? String
        self.livenow = respnce["livenow"] as? Int
        self.image = respnce["image"] as? String
    }
        
    }
