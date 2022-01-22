//
//  SeparatorTableViewCell.swift
//  TestExercise
//
//  Created by Dima on 20.01.22.
//


import UIKit

final class SeparatorTableViewCell: BaseTableViewCell {
    static let cellIdentifier = "SeparatorTableViewCell"
    
    private let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configureView() {
        contentView.addSubview(separatorView)
        separatorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        separatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        separatorView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
}
