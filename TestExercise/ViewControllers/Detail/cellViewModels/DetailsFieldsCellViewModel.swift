//
//  DetailsFieldsCellViewModel.swift
//  TestExercise
//
//  Created by Dima on 20.01.22.
//

import Foundation

class DetailsFieldsCellViewModel: BaseCellViewModel {
    
    var leftText: String
    var rightText: String
    
    init(leftText: String, rightText: String) {
        self.leftText = leftText
        self.rightText = rightText
        super.init(cellIdentifier: DetailsFieldsCell.identifier)
        
    }
    
}
