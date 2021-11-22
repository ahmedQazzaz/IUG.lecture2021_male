//
//  ExampleViewController.swift
//  ContinueWorking2
//
//  Created by Ahmed Qazzaz on 22/11/2021.
//

import UIKit

class ExampleViewController: UIViewController {

    
    @IBOutlet weak var tb_myTable : UITableView!
    var myList : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddViewController {
            //vc.delegate = self
            vc.didAddItem = { [weak self] item in
                guard let wself = self else {return}
                wself.myList.append(item)
                wself.tb_myTable.reloadData()
            }
        }
    }

}

extension ExampleViewController : AddItemDelegate{
   
    func didAddItem(_ item: String) {
        myList.append(item)
        tb_myTable.reloadData()
    }
    
    
}

extension ExampleViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = myList[indexPath.row]
        
        return cell
    }
    
    
}

protocol AddItemDelegate : NSObjectProtocol{
    func didAddItem(_ item : String)
}
