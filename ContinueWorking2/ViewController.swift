//
//  ViewController.swift
//  ContinueWorking2
//
//  Created by Ahmed Qazzaz on 08/11/2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak private var txt_myField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "detailsSegue" {
            if txt_myField.text!.isEmpty {
                
                let alertMessage = UIAlertController(title: "Something went wrong", message: "The text field might be empty", preferredStyle: .alert)
                
                //Create the OK button
                let okButton = UIAlertAction(title: "OK", style: .default, handler: { action in
                    print("ok button clicked")
                })
                
                //Add the OK button to the Message Box
                alertMessage.addAction(okButton)
                
                //Show the message box
                present(alertMessage, animated: true)
                
                return false
            }
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            if let vc = segue.destination as? DetailsViewController {
                vc.content = txt_myField.text
            }
        }
    }

    
    @IBAction func dontDoSomething(_ sender : UIButton){
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondView") as? DetailsViewController else {return}
        vc.content = txt_myField.text
        present(vc, animated: true)
        
    }

}

