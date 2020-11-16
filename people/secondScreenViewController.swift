//
//  secondScreenViewController.swift
//  people
//
//  Created by keeheng on 16/11/2020.
//  Copyright © 2020 keeheng. All rights reserved.
//

import UIKit

class secondScreenViewController: UIViewController {
    var person : Person?
    
    @IBOutlet weak var phoneConstant: UILabel!
    @IBOutlet weak var emailConstant: UILabel!
    @IBOutlet weak var nameConstant: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = person?.name
        emailLabel.text = person?.email
        phoneLabel.text = person?.mobile_number
        
        let showFriendButton = UIBarButtonItem(title: "Friends", style: .plain, target: self, action: #selector(showButtonTapped))
             
             editButtonItem.style = .plain
             
             self.navigationItem.rightBarButtonItems = [showFriendButton]
    }
    
    @objc func showButtonTapped(){
        performSegue(withIdentifier: "GoToFriendList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToFriendList"{
             let destinationVC = segue.destination as! thirdScreenTableViewController
            destinationVC.friendList = person?.friends
         }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
