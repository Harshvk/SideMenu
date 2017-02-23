//
//  SideMenuVC.swift
//  SideMenu
//
//  Created by appinventiv on 23/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {

    //MARK: Properties
    /*--------------*/
    var categories = ["Home","Green","Red"]
    
    //MARK: IBOutlet
    /*------------*/
    @IBOutlet weak var categoryTable: UITableView!
    
    //MARK: View Life Cycle
    /*-------------------*/
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Private Functions
    /*---------------------*/
    private func initialSetup(){
        
        self.categoryTable.dataSource = self
        self.categoryTable.delegate = self
        
    }
}



class categoryCell : UITableViewCell {
    
    //MARK: IBOutlet
    /*------------*/
    @IBOutlet weak var categoryLabel: UILabel!
    
    
}

//MARK: TableView DataSource and Delegate
/*-------------------------------------*/
extension SideMenuVC : UITableViewDataSource ,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCellID", for: indexPath) as! categoryCell
        cell.categoryLabel.text = categories[indexPath.item]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        case 0:
            
            let pageVC = self.storyboard?.instantiateViewController(withIdentifier: "HomePageVC") as! HomePageVC
            let parent = self.parent as! MainVC
            parent.changeChild(child: pageVC)
            
        case 1:
            
             let pageVC = self.storyboard?.instantiateViewController(withIdentifier: "GreenVC") as! GreenVC
             let parent = self.parent as! MainVC
             parent.changeChild(child: pageVC)
        case 2:
            
            let pageVC = self.storyboard?.instantiateViewController(withIdentifier: "RedVC") as! RedVC
            let parent = self.parent as! MainVC
            parent.changeChild(child: pageVC)
            
        default: print("Something is wrong")
            
        }
        
       
    }
    
    
    
}
