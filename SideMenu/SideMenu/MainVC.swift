//
//  MainVC.swift
//  SideMenu
//
//  Created by appinventiv on 23/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    //MARK: Properties
    /*---------------*/
    var sideMenu = SideMenuVC()
    var homePage = UIViewController()
    var count = 0
    
    //MARK: IBOutlet
    /*------------*/
    @IBOutlet weak var sideMenuBtn: UIButton!
    
    //MARK: View Life Cycle
    /*-------------------*/
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillLayoutSubviews() {
        
        self.addChildViewController(homePage)
        self.view.addSubview(homePage.view)
        
        homePage.view.frame = CGRect(x: 0, y: 0, width: Int(self.view.frame.width), height: Int(self.view.frame.height))
        self.sideMenuBtn.isSelected = false
        self.addChildViewController(sideMenu)
        self.view.addSubview(sideMenu.view)
        sideMenu.view.frame = CGRect(x: -200, y: 0, width: 200, height: 667)
        sideMenu.didMove(toParentViewController: self)
    }
    
    //MARK: IBAction
    /*------------*/
    @IBAction func sideMenuBtnTapped(_ sender: UIButton) {
        
        if sender.isSelected{
            
            sideMenu.view.frame = CGRect(x: -200, y: 0, width: 200, height: 667)

        }
        else{
            
           
            sideMenu.view.frame = CGRect(x: 0, y: 0, width: 200, height: 667)

        }
        
        sender.isSelected = !sender.isSelected

    }
    
    //MARK: Functions
    /*-------------*/
    func changeChild(child : UIViewController){
        homePage.removeFromParentViewController()
        homePage = child
        viewWillLayoutSubviews()
    }
    
    //MARK: Private Functions
    /*---------------------*/
    private func initialSetup(){
        
        homePage = self.storyboard?.instantiateViewController(withIdentifier: "HomePageVC") as! HomePageVC
        sideMenu = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuVC") as! SideMenuVC
    }

}
