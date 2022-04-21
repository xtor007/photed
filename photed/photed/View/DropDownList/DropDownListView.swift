//
//  DropDownList.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 21.04.2022.
//

import UIKit

class DropDownListView: UIView {

    private var items: [Topic?] = []
    private(set) var selectItem: Topic?
    private var isClosed = true
    
    private let cellId = "listCell"
    
    lazy var mainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttColor")
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonIsTapped(sender:)), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height/5)
        return button
    }()
    
    lazy var isOpenImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.down")
        image.tintColor = .white
        image.frame = CGRect(x: frame.width-EnvData.paddingLeft-mainButton.frame.height/2, y: mainButton.frame.height*3/8, width: mainButton.frame.height/2, height: mainButton.frame.height/4)
        return image
    }()
    
    var listTable = UITableView()
    
    func initList(forList list: [Topic], isNeedEmptyItem: Bool) {
        items = list
        if isNeedEmptyItem {
            items.append(nil)
        } else {
            selectItem = items[0]
        }
        drawInterface()
    }
    
    func closeMenu(time: TimeInterval = 0.2) {
        //listTable.isHidden = true
        isClosed = true
        UIView.animate(withDuration: time, delay: time, options: .curveEaseOut) {
            self.listTable.frame = CGRect(x: self.listTable.frame.minX, y: self.listTable.frame.minY, width: self.listTable.frame.width, height: 0)
        }
        listTable.frame = CGRect(x: listTable.frame.minX, y: listTable.frame.minY, width: listTable.frame.width, height: 0)
        isOpenImage.image = UIImage(systemName: "chevron.down")
    }
    
    func openMenu() {
        //listTable.isHidden = false
        isClosed = false
        UIView.animate(withDuration: 0.2, delay: 0.2, options: .curveEaseIn) {
            self.listTable.frame = CGRect(x: self.listTable.frame.minX, y: self.listTable.frame.minY, width: self.listTable.frame.width, height: self.frame.height*4/5)
        }
        isOpenImage.image = UIImage(systemName: "chevron.up")
    }
    
    private func drawInterface() {
        backgroundColor = .clear
        mainButton.setTitle(getTextFromItem(item: selectItem), for: .normal)
        addSubview(mainButton)
        listTable = UITableView(frame: CGRect(x: 0, y: frame.height/5, width: frame.width, height: frame.height*4/5))
        listTable.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: cellId)
        listTable.delegate = self
        listTable.dataSource = self
        closeMenu(time: 0)
        addSubview(listTable)
        addSubview(isOpenImage)
    }
    
    private func getTextFromItem(item: Topic?) -> String {
        if let item = item {
            return item.rawValue
        } else {
            return "All"
        }
    }
    
    @objc private func buttonIsTapped(sender: UIButton) {
        //listTable.isHidden.toggle()
        if !isClosed {
            closeMenu()
        } else {
            openMenu()
        }
    }

}

extension DropDownListView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ListCell
        cell.nameLabel.text = getTextFromItem(item: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return frame.height/5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectItem = items[indexPath.row]
        mainButton.setTitle(getTextFromItem(item: selectItem), for: .normal)
        closeMenu(time: 0.1)
    }

}
