//
//  Structs.swift
//  APIMarquezM
//
//  Created by IYMM on 13/11/22.
//

import Foundation

struct Result: Decodable {
    var results: [Results]
}

struct Results: Codable {
    var genres : String
}

struct genres : Codable{
   var id : Int
   var name : String
}
