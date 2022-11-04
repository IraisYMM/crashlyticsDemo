//
//  ViewController.swift
//  ConsumoApiExamen
//
//  Created by IYMM on 03/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    let parser = Parser()
    var results = [Results]()
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parser.parse{
            data in
            self.results = data
            DispatchQueue.main.async {
                self.TableView.reloadData()

            }
                    }
        TableView.dataSource = self
    }


}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = results[indexPath.row].email
        return cell
    }
}

