//
//  ViewController.swift
//  APIMarquezM
//
//  Created by IYMM on 13/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemFill.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 1.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    func loadData(){
        let url = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=919f8d42fffaae3eb8e826f15c5d7784")!
        let task = URLSession.shared.dataTask(with: url){
            [self](data, response, error) in let data = data
            print(String(data:data!, encoding: .utf8)!)
            
            let user = try! JSONDecoder().decode(Result.self, from: data!)
            print(user.results[0])
        }
        task.resume()
    }
}

