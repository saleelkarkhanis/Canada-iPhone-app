//
//  InfoElementTableViewCell.swift
//  CanadaInfo
//
//  Created by synerzip on 21/02/18.
//  Copyright © 2018 saleelkarkhanis. All rights reserved.
//

import UIKit

class InfoElementTableViewCell: UITableViewCell {

    var elementTitleLabel = UILabel()
    var elementImage = UIImageView()
    var elementDescriptionLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCellForIndex(index: Int) {
        setupImageWithURLString(urlString: "")
        setupTitleLabelWithText(text: "Title --- \(index)")
        setupDescriptionLabelWithText(text: "Description ----- \(index)")
    }
    
    private func setupTitleLabelWithText(text: String) {
    
        elementDescriptionLabel.numberOfLines = 0
        elementDescriptionLabel.lineBreakMode = .byWordWrapping
        elementTitleLabel.text = text
        contentView.addSubview(elementTitleLabel)
        addConstraintToTitleLabel()
    }
    
    private func addConstraintToTitleLabel() {
        elementTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        elementTitleLabel.leadingAnchor.constraint(equalTo: elementImage.trailingAnchor, constant: 10).isActive = true
        elementTitleLabel.trailingAnchor.constraint(equalTo: elementTitleLabel.superview!.trailingAnchor, constant: -10).isActive = true
        elementTitleLabel.topAnchor.constraint(equalTo: elementTitleLabel.superview!.topAnchor, constant: 10).isActive = true
    }
    
    private func setupDescriptionLabelWithText(text: String) {
        elementDescriptionLabel.numberOfLines = 0
        elementDescriptionLabel.lineBreakMode = .byWordWrapping
        elementDescriptionLabel.text = text
        contentView.addSubview(elementDescriptionLabel)
        addConstraintToDescriptionLabel()
    }
    
    private func addConstraintToDescriptionLabel() {
        elementDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        elementDescriptionLabel.topAnchor.constraint(equalTo: elementTitleLabel.bottomAnchor, constant: 10).isActive = true
        elementDescriptionLabel.leadingAnchor.constraint(equalTo: elementTitleLabel.leadingAnchor, constant: 0).isActive = true
        elementDescriptionLabel.trailingAnchor.constraint(equalTo: elementTitleLabel.trailingAnchor, constant: 0).isActive = true
        elementDescriptionLabel.superview!.bottomAnchor.constraint(equalTo: elementDescriptionLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    private func setupImageWithURLString(urlString: String) {
        elementImage.image = UIImage(named:"placeholder_image")
        contentView.addSubview(elementImage)
        addConstraintToElementImage()
    }
    
    private func addConstraintToElementImage() {
        elementImage.translatesAutoresizingMaskIntoConstraints = false
        elementImage.topAnchor.constraint(equalTo: elementImage.superview!.topAnchor, constant: 10).isActive = true
        elementImage.leadingAnchor.constraint(equalTo: elementImage.superview!.leadingAnchor, constant: 10).isActive = true
        elementImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        elementImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
