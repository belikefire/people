//
//  firstScreenTableViewController.swift
//  people
//
//  Created by keeheng on 16/11/2020.
//  Copyright © 2020 keeheng. All rights reserved.
//

import UIKit

struct PeopleData: Decodable{
    var people: [Person]
}

struct Person: Decodable{
    let name: String
    let address: String
    let email: String
    let friends: [String]
    let mobile_number: String
}

class firstScreenTableViewController: UITableViewController {
    
    var people : [Person]?

    override func viewDidLoad() {
        super.viewDidLoad()
        people = openJsonFile()
//        print(people!)
        title = "People List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "personCell")
        
//        for person in people!{
//            print(person.name)
//        }
    }
    
    private func openJsonFile() -> [Person]?{
        if let url = Bundle.main.url(forResource: "people", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(PeopleData.self, from: data)
                return jsonData.people
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)

        cell = UITableViewCell(style: .value1, reuseIdentifier: "personCell")

        cell.textLabel?.text = people![indexPath.row].name
        cell.detailTextLabel?.text = people![indexPath.row].email
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToSecond", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedRow = sender as? Int
        if segue.identifier == "goToSecond"{
            let destinationVC = segue.destination as! secondScreenViewController
            destinationVC.person = people![selectedRow!]
        }
    }

}
