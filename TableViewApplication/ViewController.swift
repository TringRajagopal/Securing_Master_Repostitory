//
//  ViewController.swift
//  TableViewApplication
//
//  Created by Rajagopal G on 10/11/16.
//  Copyright © 2016 TringappsPvtLtd. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UITableViewDataSource{

    private let cellIdentifier = "Cell"

    
    //creating uiitems
    var tableView: UITableView = UITableView()
    var tableCellLabelView: UILabel = UILabel()
    
    
    //declaring array values
    var tableViewFirstNameList: [String] = ["Rajgopal","Syed", "Dhoni" , "Steven Paul" , "Siri"]
    var tableViewSecondNameList: [String] = ["Ganesan", "Abdhul", "Mahe", "Jobs", "Apple's"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting the properties for the table
        tableView.frame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: self.view.frame.height)
        tableView.backgroundColor = UIColor.cyan
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.addSubview(tableCellLabelView)
        
        tableCellLabelView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        //setting table view as subview to main view
        self.view.addSubview(tableView)
        
    }
    
    //Required methods invoked from uitableviewdatasource and uitableviewdelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnData: Int = 0
        
        
       print("before if else \(section)")
        if (section == 0){
            returnData =  tableViewFirstNameList.count
        }
        else if(section == 1){
            returnData =  tableViewSecondNameList.count
        }
        else if(section == 2){
            returnData = tableViewFirstNameList.count-3
        }
        
        
        return returnData
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("indexpath section \(indexPath)")
        //creating cell object and referring it with default registered cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
       /* cell = UITableViewCell(style: UITableViewCellStyle.value2, reuseIdentifier: cellIdentifier)*/
        if(indexPath.section == 0){
        
        cell?.textLabel?.text = tableViewFirstNameList[indexPath.row]
        //cell?.detailTextLabel?.text = tableViewSecondNameList[indexPath.row]
        }
        else if(indexPath.section == 1){
            
           cell?.textLabel?.text = tableViewSecondNameList[indexPath.row]
        }
        else if(indexPath.section == 2){
            
            cell?.textLabel?.text = tableViewSecondNameList[indexPath.row]
        }
        
        
        
        return cell!
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
        
    }
 
    /*
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        print("entering editingstyle function")
        
        //if user want to delete cells
        if editingStyle == .delete{
            tableViewFirstNameList.remove(at: indexPath.row)
            tableViewSecondNameList.remove(at: indexPath.row)
            tableView.reloadData()
            
            
        }
        
 
        
    }
     */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

