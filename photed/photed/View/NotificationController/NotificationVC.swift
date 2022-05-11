//
//  NotificationVC.swift
//  photed
//
//  Created by Берлинский Ярослав Владленович on 06.03.2022.
//

import UIKit

class NotificationVC: UIViewController {
    
    var colorStatusBar: Bool = true {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var notificationTable = UITableView()
    let cellId = "notificationCell"
    
    var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.overrideUserInterfaceStyle = .light
        events = APIObj.db.getEvants()
        drawInterface()
    }
    
    private func drawInterface() {
        notificationTable = UITableView(frame: CGRect(x: 0, y: EnvData.paddingUp, width: view.frame.width, height: view.frame.height))
        notificationTable.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: cellId)
        notificationTable.delegate = self
        notificationTable.dataSource = self
        notificationTable.backgroundColor = .black
        notificationTable.separatorColor = .white
        view.addSubview(notificationTable)
    }
    
}

extension NotificationVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? NotificationCell {
            cell.setValue(events[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
