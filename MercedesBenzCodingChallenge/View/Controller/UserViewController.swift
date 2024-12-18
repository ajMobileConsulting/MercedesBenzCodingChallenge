//
//  ViewController.swift
//  MercedesBenzCodingChallenge
//
//  Created by Alexander Jackson on 12/16/24.
//

import Combine
import UIKit

final class UserViewController: UIViewController {
    
    private var anyCancellable: AnyCancellable?
    private let viewModel: UserViewModel
    
    private var tableView: UITableView  = {
        let tableView = UITableView()
        tableView.rowHeight = 120
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UsersTableViewCell.self, forCellReuseIdentifier: UsersTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        setupTableView()
        title = "Users"
        bindData()
        viewModel.getUsers(url: EndPoints.baseUrl)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func bindData() {
        anyCancellable = viewModel.$viewStates
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                switch state {
                case .loading:
                    print("")
                case .load:
                    self?.tableView.reloadData()
                case .empty:
                    print("")
                case .error(let message):
                    self?.showAlert(message)
                }
            }
    }
    
    private func showAlert(_ message: String) {
        let uiAlertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title:"ok", style: .destructive)
        
        uiAlertController.addAction(action)
        self.present(uiAlertController, animated: true)
    }
}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.reuseIdentifier, for: indexPath) as? UsersTableViewCell else {
            return UITableViewCell()
        }
        let user = viewModel.users[indexPath.item]
        cell.configure(with: user)
        
        viewModel.getImage(url: user.avatarUrl) { imageData in
            if let imageData = imageData {
                DispatchQueue.main.async {
                    cell.avatarImageView.image = UIImage(data: imageData)
                }
            }
        }
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: present user profile
        let selectedUser = viewModel.users[indexPath.item]
        let profileViewModel = ProfileViewModel(id: selectedUser.id)
        let profileVC = ProfileViewController(viewModel: profileViewModel)
        navigationController?.pushViewController(profileVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
