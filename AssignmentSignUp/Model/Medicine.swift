//
//  Medicine.swift
//  AssignmentSignUp
//
//  Created by Jaehui Yu on 2/26/24.
//

import Foundation

struct Medicine : Codable {
    let header : Header?
    let body : Body?

    enum CodingKeys: String, CodingKey {
        case header = "header"
        case body = "body"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        header = try values.decodeIfPresent(Header.self, forKey: .header)
        body = try values.decodeIfPresent(Body.self, forKey: .body)
    }
}

struct Header : Codable {
    let resultCode : String?
    let resultMsg : String?

    enum CodingKeys: String, CodingKey {
        case resultCode = "resultCode"
        case resultMsg = "resultMsg"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resultCode = try values.decodeIfPresent(String.self, forKey: .resultCode)
        resultMsg = try values.decodeIfPresent(String.self, forKey: .resultMsg)
    }
}

struct Body : Codable {
    let pageNo : Int?
    let totalCount : Int?
    let numOfRows : Int?
    let items : [Items]?

    enum CodingKeys: String, CodingKey {
        case pageNo = "pageNo"
        case totalCount = "totalCount"
        case numOfRows = "numOfRows"
        case items = "items"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pageNo = try values.decodeIfPresent(Int.self, forKey: .pageNo)
        totalCount = try values.decodeIfPresent(Int.self, forKey: .totalCount)
        numOfRows = try values.decodeIfPresent(Int.self, forKey: .numOfRows)
        items = try values.decodeIfPresent([Items].self, forKey: .items)
    }
}

struct Items : Codable {
    let entpName : String?
    let itemName : String?

    enum CodingKeys: String, CodingKey {
        case entpName = "entpName"
        case itemName = "itemName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        entpName = try values.decodeIfPresent(String.self, forKey: .entpName)
        itemName = try values.decodeIfPresent(String.self, forKey: .itemName)
    }
}
