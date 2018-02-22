//
//  InfoElementTableViewCell.swift
//  CanadaInfo
//
//  Created by synerzip on 21/02/18.
//  Copyright © 2018 saleelkarkhanis. All rights reserved.
//

import UIKit
import AlamofireImage

class FactTableViewCell: UITableViewCell {

    var elementTitleLabel = UILabel()
    var elementImage = UIImageView()
    var elementDescriptionLabel = UILabel()
    
    func configureCellForIndex(index: Int, forFact fact: Fact) {
        setupImageWithURLString(urlString: fact.imageURL)
        setupTitleLabelWithText(text: fact.title)
        setupDescriptionLabelWithText(text: fact.description)
    }
    
    private func setupTitleLabelWithText(text: String) {
        elementTitleLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        elementTitleLabel.textColor = UIColor.darkGray
        elementTitleLabel.numberOfLines = 0
        elementTitleLabel.lineBreakMode = .byWordWrapping
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
        elementDescriptionLabel.font = UIFont.systemFont(ofSize: 15.0)
        elementDescriptionLabel.textColor = UIColor.lightGray
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
        elementImage.image = UIImage(named: imageNames.placeholder)
        if let imageURL = URL(string: urlString) {
            elementImage.af_setImage(withURL: imageURL, placeholderImage:UIImage(named: imageNames.placeholder)!)
        }
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
