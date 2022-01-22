//
//  ViewController.swift
//  TestExercise
//
//  Created by Dima on 18.01.22.
//

import UIKit

class UserListViewController: UIViewController {
    
    private let tableView: UITableView = UITableView()
    var cellViewModels = [BaseCellViewModel]()
    var genderArray = ["male", "femail", "All"]
    var ageArray = ["Age up", "Age down"]
    lazy var genderSegmentControl = UISegmentedControl(items: self.genderArray)
    lazy var upDownSegmentControl = UISegmentedControl(items: self.ageArray)
    var userModels =  [UserModel]()
    let networkLayer = NetworkLayer()
    
    fileprivate func loadData() {
        networkLayer.getUserList { [weak self] result in
            self?.userModels = result
            self?.configureCellViewModels(result, gender: "", sortType: self?.upDownSegmentControl.selectedSegmentIndex ?? 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupView()
        loadData()
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
    
    func configureCellViewModels(_ result: [UserModel], gender: String, sortType: Int) {
        
        cellViewModels.removeAll()
        var userModels = [UserModel]()
        result.forEach { model in
            if model.profile.gender == gender {
                userModels.append(model)
            } else if gender == "" {
                userModels.append(model)
            }
        }
        
        if sortType == 0 {
            userModels.sort(by: { $0.profile.age > $1.profile.age })
        } else {
            userModels.sort(by: {$0.profile.age < $1.profile.age})
        }
        
        userModels.forEach { model in
            let userCellViewModel = UserCellViewModel(model: model,
                                                      cellIdentifier: UserTableViewCell.cellIdentifier)
            cellViewModels.append(userCellViewModel)
            let separatorCellViewModel = SeparatorCellViewModel()
            cellViewModels.append(separatorCellViewModel)
        }
        
        tableView.reloadData()
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellViewModel = cellViewModels[indexPath.row] as? UserIdentifierable else { return }
        guard let model = userModels.first(where: { $0.id == cellViewModel.userId }) else { return }
        
        showUserDataViewController(model: model)
    }
    
}

private extension UserListViewController {
    
    func showUserDataViewController(model: UserModel) {
        
        let controller = ProfileDetailsViewController()
        controller.userModel = model
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func registerCells() {
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.cellIdentifier)
        tableView.register(SeparatorTableViewCell.self, forCellReuseIdentifier: SeparatorTableViewCell.cellIdentifier)
    }
    
    @objc func didChangeGenderSegment(_ segment : UISegmentedControl) {
    
        if segment.selectedSegmentIndex == 0 {
            configureCellViewModels(userModels, gender: "male", sortType: upDownSegmentControl.selectedSegmentIndex)
        } else if segment.selectedSegmentIndex == 1 {
            configureCellViewModels(userModels, gender: "female", sortType: upDownSegmentControl.selectedSegmentIndex)
        } else {
            configureCellViewModels(userModels, gender: "", sortType: upDownSegmentControl.selectedSegmentIndex)
        }
        
    }
    
    @objc func didSelectAgeSegmentControl(_ segment: UISegmentedControl) {
        let gender = genderSegmentControl.selectedSegmentIndex == 0 ? "male" : genderSegmentControl.selectedSegmentIndex == 1 ? "female" : ""
         
        configureCellViewModels(userModels, gender: gender, sortType: segment.selectedSegmentIndex)
       
    }
    
    @objc func handleRefresh() {
        tableView.refreshControl?.endRefreshing()
        loadData()
    }
    
    func setupView() {
        
        view.addSubview(genderSegmentControl)
        genderSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        genderSegmentControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        genderSegmentControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        genderSegmentControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        genderSegmentControl.addTarget(self, action: #selector(didChangeGenderSegment), for: .valueChanged)
        
        view.addSubview(upDownSegmentControl)
        upDownSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        upDownSegmentControl.topAnchor.constraint(equalTo: genderSegmentControl.bottomAnchor, constant: 5).isActive = true
        upDownSegmentControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        upDownSegmentControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        upDownSegmentControl.addTarget(self, action: #selector(didSelectAgeSegmentControl), for: .valueChanged)
        
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: upDownSegmentControl.bottomAnchor, constant: 10).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
