//
//  SearchVC.swift
//  photed
//
//  Created by Берлинский Ярослав Владленович on 06.03.2022.
//


import UIKit

class SearchVC: UIViewController {
    
    var colorStatusBar: Bool = true {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
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
        usersTable = UITableView(frame: CGRect(x: 0, y: EnvData.searchHeight+EnvData.paddingUp/2, width: view.frame.width, height: view.frame.height))
        usersTable.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: cellId)
        usersTable.delegate = self
        usersTable.dataSource = self
        usersTable.backgroundColor = .black
        usersTable.separatorColor = .white
        view.addSubview(usersTable)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.backgroundColor = .black
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.frame = CGRect(x: 0, y: EnvData.paddingUp/3, width: view.frame.width, height: EnvData.searchHeight)
        view.addSubview(searchController.searchBar)
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
        async {
            if let image = try await getImage(link: user.avatarLink) {
                cell.avatarImage.image = image
            }
        }
        cell.loginLabel.text = user.login
        cell.statistikLabel.text = "\(db.getCountOfLike(loginId: user.id).reductionInt()!)|\(db.getCountOfSee(loginId: user.id).reductionInt()!)"
        return cell
    }
    
//    func getImage(link: String?) async throws -> UIImage? {
//        if link != nil {
//            let url = URL(string: link!)
//            if let data = try? Data(contentsOf: url!) {
//                return UIImage(data: data)
//            }
//        }
//        return nil
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileVC = ProfileVC()
        profileVC.userLoginId = users[indexPath.row].id
        //profileVC.drawInterface()
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true, completion: nil)
    }
    
}

extension SearchVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text != nil && searchController.searchBar.text != "" {
            users = db.getAllUsers(searchQuery: searchController.searchBar.text)
        } else {
            users = db.getAllUsers()
        }
        usersTable.reloadData()
    }
    
}
