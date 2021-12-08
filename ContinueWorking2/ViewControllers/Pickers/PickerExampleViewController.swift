//
//  PickerExampleViewController.swift
//  ContinueWorking2
//
//  Created by Ahmed Qazzaz on 27/11/2021.
//

import UIKit

class PickerExampleViewController: UIViewController {

    
    @IBOutlet weak  var txt_dateOfBirth : UITextField!
    @IBOutlet weak  var txt_intrests : UITextField!
    
    let myDatePicker = UIDatePicker()
    let myPickerView = UIPickerView()
    
    
    var myData = ["Sports",  "News", "Movies"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPickerView.delegate = self
        myPickerView.dataSource = self
        
        myDatePicker.datePickerMode = .date
        myDatePicker.preferredDatePickerStyle = .wheels
        myDatePicker.addTarget(self, action: #selector(datePickerDidChanged(_:)), for: .valueChanged)
        
        txt_dateOfBirth.inputView = myDatePicker
        
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        txt_dateOfBirth.inputAccessoryView = toolbar
        
        let closeButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(didDismissKeyboard(_:)))
        
                
        toolbar.setItems([UIBarButtonItem.flexibleSpace(), closeButton, UIBarButtonItem.flexibleSpace()], animated: false)
        
        txt_intrests.inputView = myPickerView
        txt_intrests.inputAccessoryView = toolbar
        toolbar.backgroundColor = .blue
//        toolbar.isTranslucent = false
    }
    
    @objc func didDismissKeyboard(_ sender : UIBarButtonItem){
//        txt_dateOfBirth.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    @objc func datePickerDidChanged(_ sender : UIDatePicker){
        let selectedDate = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE dd MMM yyyy"
        // dd : Day e.g. 27
        // MM : Month e.g. 11
        // yy : Year e.g. 2021
        // MMM : Month short name : Nov.
        // MMMM: Month Name : November
        // EEE : Day Short name : Sat.
        // EEEE: Day Name : Saturday
        // hh : hours (12)
        // HH : hourse (24)
        // mm : minutes
        // ss : seconds
        // a : (am/pm)
        txt_dateOfBirth.text = dateFormatter.string(from: selectedDate)
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


extension PickerExampleViewController : UIPickerViewDelegate, UIPickerViewDataSource {
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myData.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(row == 0){
            return "Please make a choice"
        }
        return myData[row - 1]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (row == 0){
            txt_intrests.text = ""
        }else{
            txt_intrests.text = myData[row - 1]
        }
    }
    
    
    
}
