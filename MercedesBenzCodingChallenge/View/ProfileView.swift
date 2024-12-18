//
//  ProfileView.swift
//  MercedesBenzCodingChallenge
//
//  Created by Alexander Jackson on 12/17/24.
//

import UIKit

class ProfileView: UIView {
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let profileNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let profileCompanyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let profileLocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let profileFollowersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let profileFollowingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Name"
        return label
    }()
    
    private let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Company"
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Location"
        return label
    }()
    
    private let followersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Followers"
        return label
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Following"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(profileImageView)
        addSubview(profileNameLabel)
        addSubview(profileCompanyLabel)
        addSubview(profileLocationLabel)
        addSubview(profileFollowersLabel)
        addSubview(profileFollowingLabel)
        addSubview(nameLabel)
        addSubview(companyLabel)
        addSubview(locationLabel)
        addSubview(followersLabel)
        addSubview(followingLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 200),
            profileImageView.heightAnchor.constraint(equalToConstant: 200),
            
            profileNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            profileNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileNameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            nameLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            profileCompanyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            profileCompanyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileCompanyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileCompanyLabel.heightAnchor.constraint(equalToConstant: 20),
            
            companyLabel.topAnchor.constraint(equalTo: profileCompanyLabel.bottomAnchor, constant: 4),
            companyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            companyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            companyLabel.heightAnchor.constraint(equalToConstant: 20),
            
            profileLocationLabel.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 16),
            profileLocationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileLocationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileLocationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.topAnchor.constraint(equalTo: profileLocationLabel.bottomAnchor, constant: 4),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            profileFollowersLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 16),
            profileFollowersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileFollowersLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileFollowersLabel.heightAnchor.constraint(equalToConstant: 20),
            
            followersLabel.topAnchor.constraint(equalTo: profileFollowersLabel.bottomAnchor, constant: 4),
            followersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            followersLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            followersLabel.heightAnchor.constraint(equalToConstant: 20),
            
            profileFollowingLabel.topAnchor.constraint(equalTo: followersLabel.bottomAnchor, constant: 16),
            profileFollowingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileFollowingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileFollowingLabel.heightAnchor.constraint(equalToConstant: 20),
            
            followingLabel.topAnchor.constraint(equalTo: profileFollowingLabel.bottomAnchor, constant: 4),
            followingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            followingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            followingLabel.heightAnchor.constraint(equalToConstant: 20)
    
        ])
    }
    
    func configure(profile: Profile) {
        profileNameLabel.text = profile.name
        profileCompanyLabel.text = profile.company
        profileLocationLabel.text = profile.location
        profileFollowersLabel.text = String(describing: profile.followers)
        profileFollowingLabel.text = String(describing: profile.following)
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
}
