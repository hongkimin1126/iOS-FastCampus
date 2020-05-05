//
//  TableViewEditing.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewEditing: UIViewController {
    
    /***************************************************
     테이블뷰 목록 수정하기 (insert, delete 등)
     ***************************************************/
    
    override var description: String { "TableView - Editing" }
    
    let tableView = UITableView()
    var data = Array(1...50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Edit", style: .plain, target: self, action: #selector(switchToEditing)
        )
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        view.addSubview(tableView)
        
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
        refreshControl.tintColor = .blue
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func reloadData() {
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    @objc func switchToEditing() { //에디트버튼을 눌렀을때 해야하는 행동.
        
        tableView.setEditing(!tableView.isEditing, animated: true) //에디팅 중이면 에디팅을 멈추고, 멈춤 상태면 에디팅을 하겠다.
        //밑에 델리게이트보면 특정셀만 활성화 시키겠다고 구현해놓음
        
    }
}

// MARK: - UITableViewDataSource

extension TableViewEditing: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
    
    // commit editingStyle  지금은 Add 액션 추가 시킨거라서 딜리트 비활성화 시켰다
    //여기함수에서는 딜리트만 되기때문에 아래 델리게이트에 editingStyleForRowAt함수에서 정해줘야 한다.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .none: print("none") //아무것도 안할때
        case .delete: //딜리트일때 작업 여기서 설정안 해주면 딜리트 모양은 생기지만 아무것도 작동하지 않는다!!
            data.remove(at: indexPath.row)// 밑에 유아이상으로 지우기 전에 먼저 이걸로 실제 데이터 지워야한다(순서 중요!!! ). 이거 안하면 앱 죽는다.
            tableView.deleteRows(at: [indexPath], with: .automatic)// 이거는 UI상에서 딜리트시 사라지는거라서 실제 데이터도 지워줘야한다.
            print("delete",indexPath)
        case .insert: //인서트일때 작업
            data.insert((1...50).randomElement()!, at: indexPath.row)   //1~50 가지 랜덤으로 원하는 곳에 인서트하겠다
            tableView.insertRows(at: [indexPath], with: .right) //인서트 해줄려고 활성화,  with: .right하면 오른쪽에서날라오는 애니매이션 적용된다.
            print("insert",indexPath)
        default: print("defualt ")
        }
    }
    
    //iOS11 이후부터 가능해졌다
    // 끌어 당길때 딜리트가 없어지고 Add 액션이 추가됐다. //이거 구현 할때는 이게 우선 이라서 딜리트 주석 처리해도된다
    //trailingSwipeActionsConfigurationForRowAt를 사용 했기때문에 트레일링에서 나타나지만 leadingSwipeActionsConfigurationForRowAt 사용하면 리딩쪽에서 실행된다.
    //trailingSwipeActionsConfigurationForRowAt에서 구현하면 위에 셀에 (-)뜨게 한것보다 이에 우선이라 add액션만 추가하면 (-)눌러도 딜리트 안뜨니 딜리트도 여기서 추가 해줘야 한다.
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addAction = UIContextualAction(style: .normal, title: "Add") { (action, sourceView, actionPerformed) in //끌어당길때 add액셕을 추가시키는 작업
            print("Add Action")
        
            
        }
        addAction.backgroundColor = .blue //액션 색상변경
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, actionPerformed) in     //trailingSwipeActionsConfigurationForRowAt에서 구현하면 위에 셀에 (-)뜨게 한것보다 이에 우선이라 add액션만 추가하면 (-)눌러도 딜리트 안뜨니 딜리트도 여기서 추가 해줘야 한다.
            print("Delete Action")
 
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [addAction, deleteAction])//[addAction, deleteAction] 앞쪽에 있는게 오른 쪽에 위치한다 여기서는 addAction이 가장 오른쪽에 배치된다.
        configuration.performsFirstActionWithFullSwipe = false //이거 때문에 길게 잡아당겨도 Add가 실행되지 않는다. 짥게 당겨서 버튼을 누르는 것만 가능해졌다.
        
        return UISwipeActionsConfiguration(actions: [addAction, deleteAction])//[addAction, deleteAction] 앞쪽에 있는게 오른 쪽에 위치한다 여기서는 addAction이 가장오른쪽에 배치된다.
    }
    
}

// MARK: - UITableViewDelegate

extension TableViewEditing: UITableViewDelegate {
    
    //생략하게 되면 기본값이 true라서 특정 로우만 건들게 아니면 할필요 없다.
    //각 인뎃스패스의 정보를 받아서
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
        //indexPath.row.isMultiple(of: 2) ? true : false  //짝수만 에디팅 활성화 시킬려고 만든것
    }
    
    //에디팅에서 딜리트로 할지 인서트로 할지 정하는 매서드 ->editingStyleForRowAt
    //각행마다 뭘할지 정해준다.
    //기본값: 딜리트
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        let row = indexPath.row
        if row % 3 == 0 { //0번째 줄은 기본
            return .none
        } else if row % 3 == 1{ //1번째 줄은 딜리트
            return .delete
        } else {                //2번째 줄은 인서트
            return .insert
        }
    }
}

