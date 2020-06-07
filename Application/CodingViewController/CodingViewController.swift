//
//  CodingViewController.swift
//  Application
//
//  Created by Alok Singh on 4/17/20.
//  Copyright © 2020 Alok Singh. All rights reserved.
//


import UIKit

/// <#Description#>
class CodingViewController: BaseViewController {
    
    /// <#Description#>
    @IBOutlet weak var tableView: UITableView!
    var modals:[[String:String]] = [
        [
            "title":"Java",
            "fileName":"1"
        ],
        [
            "title":"Go",
            "fileName":"2"
        ],
        [
            "title":"Python",
            "fileName":"3"
        ],
        [
            "title":"Ruby",
            "fileName":"4"
        ],
        [
            "title":"Erlang",
            "fileName":"5"
        ],
        [
            "title":"NodeJs",
            "fileName":"6"
        ]
    ]

    /// <#Description#>
    override func viewDidLoad() {
        super.viewDidLoad()
        startUpInitialisations()
        setupForNavigationBar()
        registerForNotifications()
        updateUserInterfaceOnScreen()
    }
            
    /// <#Description#>
    internal func startUpInitialisations(){
        setupForTableView()
    }
    
    /// <#Description#>
    internal func setupForNavigationBar(){
    }

    /// <#Description#>
    internal func registerForNotifications(){
        
    }
    
    /// <#Description#>
    internal func updateUserInterfaceOnScreen(){
        tableView.reloadData()
    }

    /// <#Description#>
    internal func setupForTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "GenericCell")
    }
    
}

extension CodingViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushDetailView(indexPath: indexPath)
    }
    
    
    /// <#Description#>
    ///
    /// - Parameter indexPath: <#indexPath description#>
    @objc func pushDetailView(indexPath: IndexPath){
        if let viewController = viewControllerObject(identifier: "TextualShowCaseViewController") as? TextualShowCaseViewController {
            viewController.viewModel = modals[indexPath.row]
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}

extension CodingViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GenericCell") {
            let item = modals[indexPath.row]
            if let title = item["title"] {
                cell.textLabel?.text = title
                cell.textLabel?.textColor = .white
                cell.textLabel?.font = .systemFont(ofSize: 18)
                cell.backgroundColor = .black
                cell.contentView.backgroundColor = .black
            }
            return cell
        }
        return UITableViewCell()
    }
    
}
