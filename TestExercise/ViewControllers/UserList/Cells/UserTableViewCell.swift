//
//  UserTableViewCell.swift
//  TestExercise
//
//  Created by Dima on 19.01.22.
//

import UIKit

final class UserTableViewCell: BaseTableViewCell {
    static let cellIdentifier = "UserTableViewCell"
    
    private var genderLabel: UILabel = UILabel()
    private var nameLabel: UILabel = UILabel()
    private var ageLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func fill(viewModel: BaseCellViewModel) {
        super.fill(viewModel: viewModel)
        guard let viewModel = viewModel as? UserCellViewModel else { return }
        genderLabel.text = viewModel.gender
        nameLabel.text = viewModel.name
        ageLabel.text = viewModel.age
        
    }
}

// MARK: - Private

private extension UserTableViewCell {
    
    func configureViews() {
        contentView.addSubview(genderLabel)
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        genderLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        genderLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
       // genderLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        
        
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        contentView.addSubview(ageLabel)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        ageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        ageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        ageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
}

