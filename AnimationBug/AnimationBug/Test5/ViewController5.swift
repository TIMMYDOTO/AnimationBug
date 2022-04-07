//
//  ViewController5.swift
//  TEST
//
//  Created by Artyom on 07.04.2022.
//

import UIKit

class ViewController5: UIViewController {
    var idsToShow = [Int]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension ViewController5: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sportDetailsHeaderView: SportDetailsHeaderView = .fromNib()
        sportDetailsHeaderView.backgroundColor = .gray
     
        sportDetailsHeaderView.headerLabel.text = "Header section \(section)"
        sportDetailsHeaderView.tapOnRollup = { [weak self]  in
            guard let self = self else { return }
            
                if self.idsToShow.contains(section) {

                    self.idsToShow = self.idsToShow.filter({$0 != section})
             

                    tableView.insertRows(at: [IndexPath(row: 0, section: section)], with: .fade)
                    
                    



                }else{

                    self.idsToShow.append(section)
                    tableView.deleteRows(at: [IndexPath(row: 0, section: section)], with: .fade)
                    
                   

                }
            
        }
        return sportDetailsHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if idsToShow.contains(section){
            return 0
        }else{
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableView5Cell
        cell.textLabel?.text = "section: \(indexPath.section)"
        return cell
    }
    
    
  
}


extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
