//
//  SettingsVC.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 18.04.2022.
//

import UIKit

class SettingsVC: UIViewController {
    
    var userLoginId: String!
    let cellId = "settingsCell"
    
    var settingsTable = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .gray
        drawInterface()
    }
    
    func drawInterface() {
        settingsTable = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width))
        settingsTable.register(UINib(nibName: "SettingsCell", bundle: nil), forCellReuseIdentifier: cellId)
        settingsTable.delegate = self
        settingsTable.dataSource = self
        settingsTable.backgroundColor = .clear
        view.addSubview(settingsTable)
    }
    
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsScreensParametrs.screens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SettingsCell
        let parametrs = SettingsScreensParametrs.screens[indexPath.row]
        cell.editData(image: parametrs.image, name: parametrs.name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return EnvData.tableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let parametrs = SettingsScreensParametrs.screens[indexPath.row]
        let controller = parametrs.controller
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }

}
