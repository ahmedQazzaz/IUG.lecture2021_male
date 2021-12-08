//
//  AddViewController.swift
//  ContinueWorking2
//
//  Created by Ahmed Qazzaz on 22/11/2021.
//

import UIKit

class AddViewController: UIViewController {

    weak var delegate : AddItemDelegate?
    
    var didAddItem : ((_ : String)->Void)?
    
    @IBOutlet weak var myTextField : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addItemAction(_ sender : UIButton){
        //self.delegate?.didAddItem(myTextField.text ?? "")
        self.didAddItem?(myTextField.text ?? "")
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
