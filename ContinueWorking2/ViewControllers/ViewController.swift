//
//  ViewController.swift
//  ContinueWorking2
//
//  Created by Ahmed Qazzaz on 08/11/2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak private var lb_timer : UILabel!
    @IBOutlet weak private var btn_start : UIButton!
    
    @IBOutlet weak private var txt_myField : UITextField!
    let authManager = AuthServices()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let startDate = UserDefaults.standard.object(forKey: "timerStartTime") as? Date{
            btn_start.isEnabled = false
            let difference = Int(Date().timeIntervalSince1970 - startDate.timeIntervalSince1970)
            let hours = difference / 3600
            let minutes = (difference / 60) % 60
            let seconds = difference % 60
            
            
            lb_timer.text = "\(hours):\(minutes):\(seconds)"
        }
        
//        authManager.loginUsing(username: "ahmed",
//                               password: "123456") { obj in
//            let alert = UIAlertController(title: "Response", message: obj?.user?.username ?? "Unknown error", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//
//            // Execute the code in Main Thread
//            // UI modifications should only be executed on Main Thread
//            DispatchQueue.main.async {
//                self.present(alert, animated: true)
//            }
//
//
//        }
    }
    
    
    @IBAction func startAction(_ sender : UIButton){
        let currentDate = Date()
        UserDefaults.standard.set(currentDate, forKey: "timerStartTime")
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { t in
            //show the counter
        }
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

