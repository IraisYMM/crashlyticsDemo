//
//  Users.swift
//  ConsumoApiExamen
//
//  Created by IYMM on 03/11/22.
//

import Foundation

struct Root: Codable{
    let results : [Results]
    
}
struct Results : Codable{
    let name : Name
    let email : String
    let location : Location
    let username : Login
    let phone : String
    
}
struct Name : Codable{
    let firts : String
}
struct Location : Codable{
    let city : String
}
struct Login : Codable{
let username: String
}
