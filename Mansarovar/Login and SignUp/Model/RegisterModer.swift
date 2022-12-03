//
//  LogIn.swift
//  Mansarovar
//
//  Created by Sunil Developer on 02/12/22.
//

import Foundation

struct RegisterModel : Codable {
	let error : String?
	let msg : String?
	let status : String?

	enum CodingKeys: String, CodingKey {

		case error = "error"
		case msg = "msg"
		case status = "status"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		error = try values.decodeIfPresent(String.self, forKey: .error)
		msg = try values.decodeIfPresent(String.self, forKey: .msg)
		status = try values.decodeIfPresent(String.self, forKey: .status)
	}

}
