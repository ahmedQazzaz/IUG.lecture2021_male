//
//  DetailsViewController.swift
//  ContinueWorking2
//
//  Created by Ahmed Qazzaz on 13/11/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak private var myLabel : UILabel!
    var content : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = content
        // Do any additional setup after loading the view.
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
