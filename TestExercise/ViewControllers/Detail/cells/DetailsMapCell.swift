//
//  DetailsMapCell.swift
//  TestExercise
//
//  Created by Dima on 20.01.22.
//
import MapKit
import UIKit

class DetailsMapCell: BaseTableViewCell {
    
    static let identifier = "DetailsMapCell"
    var mapView = MKMapView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func fill(viewModel: BaseCellViewModel) {
        super.fill(viewModel: viewModel)
        guard let viewModel = viewModel as? MapCellViewModel else { return }
        mapView.setCenter(viewModel.point.coordinate, animated: false)
        mapView.addAnnotation(viewModel.point)
    }
}

private extension DetailsMapCell {
    
    func setupView() {
        contentView.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        mapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        mapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        mapView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}
