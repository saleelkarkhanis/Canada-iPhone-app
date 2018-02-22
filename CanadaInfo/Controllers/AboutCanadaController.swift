//
//  ViewController.swift
//  CanadaInfo
//
//  Created by synerzip on 21/02/18.
//  Copyright © 2018 saleelkarkhanis. All rights reserved.
//

import UIKit

class AboutCanadaController: UIViewController {

    private let tableViewTopContentInset: CGFloat = 20
    private let tableViewEstimatedRowHeight: CGFloat = 70
    private let defaultNavigationTitle = "Home"
    private let defaultErrorAlertTitle = "Error"
    private let defaultErrorAlertOKButtonTitle = "OK"
    
    var tableView = UITableView()
    var facts = [Fact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFactsData()
    }
    
    private func getFactsData() {
        showProgressSpinner()
        FactsService.sendGetFactsRequest { [weak self] (response) in
            hideProgressSpinner()
            switch response {
            case .failure(let error):
                self?.showErrorAlertWithMessage(message: error.localizedDescription)
            case .success(let result):
                if let output = result as? ([Fact], String) {
                    // Update View to show data coming feom Server
                    self?.title = output.1
                    self?.facts = output.0
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableView.register(FactTableViewCell.self, forCellReuseIdentifier: cellIdentifiers.infoElementCell)
        tableView.contentInset.top = tableViewTopContentInset
        self.tableView.tableFooterView = UIView()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = tableViewEstimatedRowHeight
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
    }
    
    private func showErrorAlertWithMessage(message: String) {
        let errorAlertController = UIAlertController(title: defaultErrorAlertTitle, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: defaultErrorAlertOKButtonTitle, style: .default, handler: nil)
        errorAlertController.addAction(okAction)
        self.present(errorAlertController, animated: true, completion: nil)
    }
    
    private func setupNavigationItem() {
        let refreshButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.refresh, target: self, action: #selector(refreshButtonAction))
        self.navigationItem.rightBarButtonItem = refreshButton
        self.title = defaultNavigationTitle // This is Default Navigation title to be shown in case title does not come from Server
    }
    
    @objc func refreshButtonAction() {
        getFactsData()
    }
}

extension AboutCanadaController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.infoElementCell, for: indexPath) as! FactTableViewCell
        let currentFact = facts[indexPath.row]
        cell.configureCellForIndex(index: indexPath.row, forFact: currentFact)
        return cell
    }
}

