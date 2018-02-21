//
//  ViewController.swift
//  CanadaInfo
//
//  Created by synerzip on 21/02/18.
//  Copyright © 2018 saleelkarkhanis. All rights reserved.
//

import UIKit

class AboutCanadaController: UIViewController {

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFactsData()
    }
    
    private func getFactsData() {
        FactsService.sendGetFactsRequest { (response) in
            switch response {
            case .failure(let error):
                print("Error - \(error.localizedDescription)")
            case .success(let result):
                if let output = result as? ([Fact], String) {
                    // Do refresh view with data
                }
            }
        }
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableView.backgroundColor = UIColor.white
        tableView.register(InfoElementTableViewCell.self, forCellReuseIdentifier: "infoElementCell")
        tableView.contentInset.top = 20
        self.tableView.tableFooterView = UIView()
        
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 70.0;
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
    }
}

extension AboutCanadaController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoElementCell", for: indexPath) as! InfoElementTableViewCell
        cell.configureCellForIndex(index: indexPath.row)
        return cell
    }
    
}

