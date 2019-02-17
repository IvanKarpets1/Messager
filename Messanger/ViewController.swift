//
//  ViewController.swift
//  Messanger
//
//  Created by Ivan Karpets on 1var/19.
//  Copyright © 2019 Ivan Karpets. All rights reserved.
//

import UIKit

extension Date{
    static func convertDate(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}

class ViewController: UITableViewController {
    
    let messagesFromServer =
    [
        
            textMessage(text: "Answer misery adieus add wooded how nay men before though.", isComing: true, date: Date.convertDate(customString: "10/03/2019")),
            textMessage(text: "Speedily say has suitable disposal add boy. On forth doubt miles of child.", isComing: false, date: Date.convertDate(customString: "10/03/2019")),
       
            textMessage(text: "Procuring as in resembled by in agreeable. Next long no gave mr eyes.", isComing: false, date: Date.convertDate(customString: "10/04/2019")),
            textMessage(text: "Not its herself forming charmed amiable. Him why feebly expect future now.", isComing: true, date: Date.convertDate(customString: "10/04/2019")),
       
            textMessage(text: "Old her object chatty regard vulgar missed.", isComing: false, date: Date.convertDate(customString: "10/05/2019")),
            textMessage(text: "Alteration literature to or an sympathize mr imprudence.", isComing: false, date: Date.convertDate(customString: "10/05/2019"))
        
    ]
    
    var messages = [[textMessage]]()
    
    fileprivate var cellid = "cellid"
    override func viewDidLoad() {
        super.viewDidLoad()
        makeMessageOrdered()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(MessageCell.self, forCellReuseIdentifier: cellid)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages[section].count
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        return "Date:\(Date())"
//
//    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(50)
    }
    
    
    fileprivate func makeMessageOrdered(){
        
        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date
        }
        print(groupedMessages)
    
        let sortedKeys = groupedMessages.keys.sorted()
        print(sortedKeys)
        sortedKeys.forEach { (key) in
            let value = groupedMessages[key]
            messages.append(value ?? [])
        }
        
        
    }
    
    
    class DateHeaderLabel: UILabel{
        
        override var intrinsicContentSize: CGSize{
                let originalContentSize = super.intrinsicContentSize
                let height = originalContentSize.height + 12
                layer.cornerRadius = height / 2
                layer.masksToBounds = true
                return CGSize(width: originalContentSize.width + 20, height: height)
            }
        }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let firstMessage = messages[section].first {
            let label = DateHeaderLabel()
            label.text = "SOME TEXT"
            label.backgroundColor = .black
            label.textColor = .white
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 14)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstMessage.date)
            
            label.text = dateString
            
            let headerView = UIView()
            headerView.addSubview(label)
            
            label.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
            
            return headerView
        }
            return nil
    }
        
        
      
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! MessageCell
        cell.message = messages[indexPath.section][indexPath.row]
        return cell
    }
    

}

