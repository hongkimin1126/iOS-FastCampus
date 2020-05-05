//
//  TableView03.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit    //

final class TableViewRefresh: UIViewController {
    
    override var description: String { "TableView - Refresh" }
    
    /***************************************************
     테이블뷰를 새로 불러올 때마다 숫자 목록을 반대로 뒤집어서 출력하기
     ***************************************************/
    
    let tableView = UITableView()
    var data = Array(1...40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem (       //네비게이션 커트롤러
            title: "Refresh".self, style: .plain, target: self, action: #selector(reloadData) //#selector(reloadData)
        )
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.rowHeight = 60 //row 크기 키워줬다.
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        view.addSubview(tableView)
        
        let refreshControl = UIRefreshControl() // 이거는 뺑글뺑글 돌아가면서 리프레시 해주는 기능 이거 안하면 위에 네비게이션 컨트롤러에 있는 버튼으로 밖에 리프레시 안된다.
        refreshControl.tintColor = .blue
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged) //.valueChanged는 값같은거 변경할때
        tableView.refreshControl = refreshControl //tableView.refreshControl에 refreshControl에 넣어줘야한다  --> 테이블뷰에 넣어줘야 작동한다.
        
        //   let attrStr = NSAttributedString () //string 을 자유자제로 설정하는것
        //        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...", forcCellR)  //이거해주면 리프레시 할때 뻉글 돌아갈대 Refreshing...문구뜬다
        
    }
    
    @objc func reloadData() { //리프레시
        data.reverse()  //리로드 할때마다  오름차순 -> 내림차순 -> 내림차순 -> 오름차순
        tableView.refreshControl?.endRefreshing() // 이거 안해주면 위에서 리프레시 돌리면 무한으로 계속 돌아간다
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension TableViewRefresh: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        
        cell.textLabel!.text = " \(data[indexPath.row]) "
        return cell
    }
}




