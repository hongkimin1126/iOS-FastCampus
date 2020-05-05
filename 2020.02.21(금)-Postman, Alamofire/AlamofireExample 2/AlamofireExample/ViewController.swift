//
//  ViewController.swift
//  AlamofireExample
//
//  Created by 양중창 on 2020/02/21.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let tableView = UITableView()
    private let serviceManager = ServiceManager.shared
    
    private var users: [User] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        serviceManager.requestUser(completionHandler: {
            [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
            case .failure(let error):
                print(error)
            }
        })
       
        
        
        
//        Date(timeIntervalSinceReferenceDate: 0) // 2000.01.01 부터 몇초 지났는지
//        Date(timeIntervalSince1970: 0) // 1970.01.01 부터 몇초 지났는지
           
    }
    
    func requestCellData(_ cell: UITableViewCell, for indexPath: IndexPath) {
        let user = users[indexPath.row]
        let imageUrl = user.photo
        serviceManager.requestImage(imageUrl, completionHandler: {
            [weak self] response in
            guard let data = try? response.get() else { return }
            
            if let cell = self?.tableView.cellForRow(at: indexPath) {// 현재 셀이 내가 요청했던 셀과 맞는지
                cell.imageView?.image = UIImage(data: data)
                cell.textLabel?.text = user.fullName
                cell.detailTextLabel?.text = user.email
            }
        })
    }
    
    private func decoding(data: Data) {
        
        do {
            let jsonObject = try JSONDecoder().decode(User.self, from: data)
            print(jsonObject)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        let guide = view.safeAreaLayoutGuide
        
        tableView.dataSource = self
        tableView.rowHeight = 60
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        users.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let user = users[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            requestCellData(cell, for: indexPath)
            return cell
        }else {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            requestCellData(cell, for: indexPath)
            return cell
            
        }
        
    }
    
    
}
