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
    
    let searchController = UISearchController(searchResultsController: nil)
    
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
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Enter the desired login..."
        searchController.searchBar.backgroundColor = .red //?
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
}

extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserCell
        let user = users[indexPath.row]
        cell.avatarImage.image = UIImage(named: "none")
//        if user.avatarLink != nil {
//            let url = URL(string: user.avatarLink!)
//            if let data = try? Data(contentsOf: url!) {
//                cell.avatarImage.image = UIImage(data: data)
//            }
//        }
        async {
            if let image = try await getImage(link: user.avatarLink) {
                cell.avatarImage.image = image
            }
        }
        cell.loginLabel.text = user.login
        cell.statistikLabel.text = "\(db.getCountOfLike(loginId: user.id).reductionInt())|\(db.getCountOfSee(loginId: user.id).reductionInt())"
        return cell
    }
    
    func getImage(link: String?) async throws -> UIImage? {
        if link != nil {
            let url = URL(string: link!)
            if let data = try? Data(contentsOf: url!) {
                return UIImage(data: data)
            }
        }
        return nil
    }
    
}

extension SearchVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}
