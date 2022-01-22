//
//  BaseTableViewCell.swift
//  TestExercise
//
//  Created by Dima on 19.01.22.
//

import UIKit

protocol FillableCell: AnyObject {
    func fill(viewModel: BaseCellViewModel)
}

open class BaseTableViewCell: UITableViewCell, FillableCell {
    public weak var viewModel: BaseCellViewModel?
    
    // MARK: Inits
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Public - Can override
    
    func fill(viewModel: BaseCellViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - Private

private extension BaseTableViewCell {
    
    func configureView() {
        backgroundColor = .clear
        selectionStyle = .none
    }
}
