//
//  ChatTableViewCell.swift
//  ChatRoom
//
//  Created by Kun Niu on 12/5/22.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    lazy var nameLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false

        label.numberOfLines = 1
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.text = "Kun"
        label.backgroundColor = .white
        return label
    }()
    
    lazy var contentLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.backgroundColor = .systemGray3
        label.sizeToFit()

        label.text = "asdjflkajewfji aweoijfkenfelwfj anknegwjgaiwej aiwnfadngiawjgfiwe wogjoisdjioe"
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.contentLabel)
//        self.contentView.backgroundColor = .black
//        self.contentView.addSubview(nameLabel)
//        self.contentView.addSubview(contentLabel)
        self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true

        self.nameLabel.bottomAnchor.constraint(equalTo: self.contentLabel.topAnchor, constant: -8).isActive = true
        self.contentLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        self.contentLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true

        self.contentLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
