//
//  DetailsFieldsCell.swift
//  TestExercise
//
//  Created by Dima on 20.01.22.
//

import UIKit

class DetailsFieldsCell: BaseTableViewCell {
    
    static let identifier = "DetailsFieldsCell"
    
    let stackView = UIStackView()
    let leftTextLabel: UILabel = UILabel()
    let rightTextLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func fill(viewModel: BaseCellViewModel) {
        super.fill(viewModel: viewModel)
        guard let viewModel =  viewModel as? DetailsFieldsCellViewModel else { return }
        leftTextLabel.text = viewModel.leftText
        rightTextLabel.text = viewModel.rightText
    }
}
extension DetailsFieldsCell {
    
    func setupView() {
        contentView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
        stackView.addArrangedSubview(leftTextLabel)
        leftTextLabel.numberOfLines = 0
        stackView.addArrangedSubview(rightTextLabel)
        rightTextLabel.numberOfLines = 0
    }
}
