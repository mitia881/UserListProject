//
//  MapCellViewModel.swift
//  TestExercise
//
//  Created by Dima on 20.01.22.
//

import UIKit
import MapKit

class MapCellViewModel: BaseCellViewModel{
    
    private let model: LocationModel
    private var userName: String
    
    var point: MKPointAnnotation {
        let point = MKPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: model.lat, longitude: model.long)
        return point
    }
    
    init(model: LocationModel, userName: String) {
        self.model = model
        self.userName = userName
        super.init(cellIdentifier: DetailsMapCell.identifier)
    }
}
