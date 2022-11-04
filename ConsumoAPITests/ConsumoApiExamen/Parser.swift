//
//  Parser.swift
//  ConsumoApiExamen
//
//  Created by IYMM on 03/11/22.
//

import Foundation

struct Parser {
    
    func parse(comp : @escaping ([Results]) ->  ()) {
        let api = URL(string: "https://randomuser.me/api/")
        
        URLSession.shared.dataTask(with: api!){
            data,response,error in
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            do{
                let result = try JSONDecoder().decode(Root.self, from: data!)
                comp(result.results)
            } catch{
                
            }
        }.resume()
    }
}
