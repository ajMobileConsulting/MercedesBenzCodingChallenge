//
//  ProfileViewController.swift
//  MercedesBenzCodingChallenge
//
//  Created by Alexander Jackson on 12/17/24.
//

import Combine
import UIKit

final class ProfileViewController: UIViewController {
    private var anyCancellable: AnyCancellable?
    private let profileView = ProfileView()
    private let viewModel: ProfileViewModel
    private lazy var errorView = ErrorView()
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        bindData()
        setProfileViewConstraints()
        viewModel.getProfile()
    }
    
    private func bindData() {
        anyCancellable = viewModel.$viewStates
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                switch state {
                case .loading:
                    print("")
                case .load:
                    self?.configureProfileView(profile: self?.viewModel.profile)
                    self?.getProfileImage()
                case .empty:
                    print("")
                case .error(let message):
                    self?.setupErrorView(message: message)
                }
            }
    }

    private func getProfileImage() {
        viewModel.getImage(url: viewModel.profile?.avatarUrl ?? "") { imageData in
            if let imageData = imageData {
                DispatchQueue.main.async {
                    self.profileView.profileImageView.image = UIImage(data: imageData)
                }
            }
        }
    }
    private func setProfileViewConstraints() {
        view.addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            profileView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    private func configureProfileView(profile: Profile?) {
        if let profile = profile {
            profileView.configure(profile: profile)
        }
    }
    
    private func setupErrorView(message: String) {
        view.addSubview(errorView)
        NSLayoutConstraint.activate([
            errorView.topAnchor.constraint(equalTo: view.topAnchor),
            errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        errorView.configure(with: message)
    }
}
