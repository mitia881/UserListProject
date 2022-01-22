//
//  SecondViewController.swift
//  TestExercise
//
//  Created by Dima on 20.01.22.
//

import UIKit

class ProfileDetailsViewController: UIViewController {
    
    let tableView: UITableView = UITableView()
    var userModel: UserModel?
    var cellViewModels = [BaseCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = userModel?.profile.name
        
        setupTableView()
        registerCell()
        configureCellViewModels()
    }
}

private extension ProfileDetailsViewController {
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerCell() {
        tableView.register(DetailsFieldsCell.self, forCellReuseIdentifier: DetailsFieldsCell.identifier)
        tableView.register(DetailsMapCell.self, forCellReuseIdentifier: DetailsMapCell.identifier)
    }
    
    func configureCellViewModels() {
        if let location = userModel?.profile.location {
            let mapCellViewModel = MapCellViewModel(model: location, userName: userModel?.profile.name ?? "")
            cellViewModels.append(mapCellViewModel)
        }
        let nameCellViewModel = DetailsFieldsCellViewModel(leftText: "Имя", rightText: userModel?.profile.name ?? "")
        cellViewModels.append(nameCellViewModel)
        let ageOfBirthCellViewModel = DetailsFieldsCellViewModel(leftText: "Дата рождения", rightText: userModel?.profile.dob ?? "")
        cellViewModels.append(ageOfBirthCellViewModel)
        let addressCellViewModel = DetailsFieldsCellViewModel(leftText: "Адрес", rightText: userModel?.profile.address ?? "")
        cellViewModels.append(addressCellViewModel)
        let emailCellViewModel = DetailsFieldsCellViewModel(leftText: "Почта", rightText: userModel?.email ?? "")
        cellViewModels.append(emailCellViewModel)
        let genderCellViewModel = DetailsFieldsCellViewModel(leftText: "Пол", rightText: userModel?.profile.gender ?? "")
        cellViewModels.append(genderCellViewModel)
        let aboutCellViewModel = DetailsFieldsCellViewModel(leftText: "О себе", rightText: userModel?.profile.about ?? "")
        cellViewModels.append(aboutCellViewModel)
        let companyCellViewModel = DetailsFieldsCellViewModel(leftText: "компания", rightText: userModel?.profile.company ?? "")
        cellViewModels.append(companyCellViewModel)
        let apiKeyCellViewModel = DetailsFieldsCellViewModel(leftText: "ApiKey", rightText: userModel?.apiKey ?? "")
        cellViewModels.append(apiKeyCellViewModel)
        if let userName = userModel?.username {
            
            let userNameCellViewModel = DetailsFieldsCellViewModel(leftText: "User name", rightText: userName)
            cellViewModels.append(userNameCellViewModel)
        }
    }
    
}

extension ProfileDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = cellViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath)
        
        if let cell = cell as? FillableCell {
            cell.fill(viewModel: cellViewModel)
        }
        return cell
    }
}
