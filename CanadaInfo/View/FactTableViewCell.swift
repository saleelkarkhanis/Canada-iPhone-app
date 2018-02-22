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

    override func layoutSubviews() {
        super.layoutSubviews()
        // To Solve issue of Multiline text only showing one line on first load
        elementDescriptionLabel.preferredMaxLayoutWidth = elementDescriptionLabel.frame.width
    }
    
    var elementTitleLabel = UILabel()
    var elementImage = UIImageView()
    var elementDescriptionLabel = UILabel()
    
    func configureCellForIndex(index: Int, forFact fact: Fact) {
        setupImageWithURLString(urlString: fact.imageURL)
        setupTitleLabelWithText(text: fact.title)
        setupDescriptionLabelWithText(text: fact.description)
    }
    
    private func setupTitleLabelWithText(text: String) {
        elementTitleLabel.font = UIFont.systemFont(ofSize: 16.0)
        elementTitleLabel.textColor = UIColor.darkGray
        elementTitleLabel.numberOfLines = 0
        elementTitleLabel.lineBreakMode = .byWordWrapping
        elementTitleLabel.text = text
        contentView.addSubview(elementTitleLabel)
        addConstraintToTitleLabel()
    }
    
    private func addConstraintToTitleLabel() {
        elementTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        let leadingConstraint = NSLayoutConstraint(item: elementTitleLabel, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: elementImage, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: 10)
        
        let trailingConstraint = NSLayoutConstraint(item: elementTitleLabel, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: elementTitleLabel.superview!, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: -10)
        
        let topConstraint = NSLayoutConstraint(item: elementTitleLabel, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: elementImage, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0)
        
        contentView.addConstraints([leadingConstraint, trailingConstraint, topConstraint])
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
        let leadingConstraint = NSLayoutConstraint(item: elementDescriptionLabel, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: elementTitleLabel, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 0)
        
        let trailingConstraint = NSLayoutConstraint(item: elementDescriptionLabel, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: elementTitleLabel, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: 0)
        
        let topConstraint = NSLayoutConstraint(item: elementDescriptionLabel, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: elementTitleLabel, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 10)
        
        
        let bottomConstraint = NSLayoutConstraint(item: elementDescriptionLabel.superview!, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.greaterThanOrEqual, toItem: elementDescriptionLabel, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 10)
        
        contentView.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
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
        
        let leadingConstraint = NSLayoutConstraint(item: elementImage, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: elementImage.superview!, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 10)
        
        let topConstraint = NSLayoutConstraint(item: elementImage, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: elementImage.superview!, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 10)
        
        
        let heightConstraint = NSLayoutConstraint(item: elementImage, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 50)
        
        let widthConstraint = NSLayoutConstraint(item: elementImage, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 50)
        
        contentView.addConstraints([leadingConstraint, topConstraint, widthConstraint, heightConstraint])
    }
}
