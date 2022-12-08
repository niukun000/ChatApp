//
//  ChatViewController.swift
//  ChatRoom
//
//  Created by Kun Niu on 12/5/22.
//

import UIKit

class ChatViewController: UIViewController {
    
    let resuse = "resuseChatCell"
    
    let charVM = ChatVM()
    
    lazy var chatTable = {
        let table = UITableView(frame: .zero)
        table.backgroundColor = .systemGray3
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.register(ChatTableViewCell.self, forCellReuseIdentifier: self.resuse)
        return table
    }()
    lazy var textfield : UITextField = {
        let input = UITextField(frame: .zero)
        input.translatesAutoresizingMaskIntoConstraints = false
        input.backgroundColor = .white
        input.layer.masksToBounds = true
        input.layer.cornerRadius = 10
        input.heightAnchor .constraint(equalToConstant: 50).isActive = true
        
        return input
    }()
    
    lazy var sendButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("send", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant:  50).isActive = true
        button.widthAnchor.constraint(equalToConstant:  50).isActive = true
        button.addTarget(self, action: #selector (sendButtonClicked), for: .touchUpInside)
        return button
    }()
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        
        self.view.addSubview(self.chatTable)
        self.view.addSubview(textfield)
        self.view.addSubview(sendButton)
        
        self.chatTable.backgroundColor = .blue
        self.chatTable.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.chatTable.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.chatTable.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//        self.chatTable.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        self.textfield.topAnchor.constraint(equalTo: self.chatTable.bottomAnchor, constant: 18).isActive = true
        self.textfield.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.textfield.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        self.textfield.trailingAnchor.constraint(equalTo: self.sendButton.leadingAnchor, constant: -8).isActive = true
        self.sendButton.topAnchor.constraint(equalTo: self.chatTable.bottomAnchor, constant: 8).isActive = true
        self.sendButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true



        // Do any additional setup after loading the view.
        self.charVM.requireData()

        self.charVM.bind {
            DispatchQueue.main.async {
                self.chatTable.reloadData()
                self.chatTable.scrollToRow(at: IndexPath(row: self.charVM.count-1, section: 0), at: .bottom, animated: true)
            }
        }
    }
    
    @objc func sendButtonClicked(){
        guard var temp = self.textfield.text else{
            return
        }
        temp = temp.trimmingCharacters(in: .whitespaces)
        if temp == ""{
            return
        }
        self.charVM.postData(content: temp)
        self.textfield.text = ""
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ChatViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("***********")
        print(self.charVM.count)
        return self.charVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.resuse, for: indexPath) as? ChatTableViewCell else {
            fatalError("error when create cell")
        }
        
//        print()
        if self.charVM.messages[indexPath.row].user == "Kun"{
            cell.contentLabel.backgroundColor = .systemBlue
            
//            cell.nameLabel.trailingAnchor.constraint(equalTo: cell.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//            cell.contentLabel.trailingAnchor.constraint(equalTo: cell.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -8) .isActive = true

        }
        else{
            cell.contentLabel.backgroundColor = .systemGray3
//            cell.nameLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8).isActive = true
//            cell.contentLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8).isActive = true
//            cell.contentLabel.backgroundColor = .systemGray3
        }
        cell.nameLabel.text = self.charVM.messages[indexPath.row].user
        cell.contentLabel.text = self.charVM.messages[indexPath.row].message
        
        return cell
        
    }
    
    
}
