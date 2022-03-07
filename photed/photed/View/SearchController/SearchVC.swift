//
//  SearchVC.swift
//  photed
//
//  Created by Берлинский Ярослав Владленович on 06.03.2022.
//


import UIKit

class SearchVC: UIViewController {
    
    var usersTable: UITableView!
    let cellId = "usersCells"
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .black
        users = db.getAllUsers()
        drawInterface()
    }
    
    private func drawInterface() {
        usersTable = UITableView(frame: view.frame)
        usersTable.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: cellId)
        usersTable.delegate = self
        usersTable.dataSource = self
        usersTable.backgroundColor = .black
        usersTable.separatorColor = .white
        view.addSubview(usersTable)
    }
    
}

extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserCell
        let user = users[indexPath.row]
        if user.avatarLink == nil {
            cell.avatarImage.image = UIImage(named: "none")
        } else {
            let url = URL(string: user.avatarLink!)
            if let data = try? Data(contentsOf: url!) {
                cell.avatarImage.image = UIImage(data: data)
            } else {
                cell.avatarImage.image = UIImage(named: "none")
            }
        }
        cell.loginLabel.text = user.login
        cell.statistikLabel.text = "\(db.getCountOfLike(loginId: user.id))|\(db.getCountOfSee(loginId: user.id))"
        return cell
    }
    
}
