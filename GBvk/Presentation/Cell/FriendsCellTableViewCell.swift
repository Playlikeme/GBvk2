//
//  FriendsCellTableViewCell.swift
//  GBvk
//
//  Created by Роман Михайлов on 19.08.2021.
//

import UIKit

class FriendsCellTableViewCell: UITableViewCell {
	
	static let identifier = "FriendsCellTableViewCell"
	

	@IBOutlet private var imageCell: UIImageView!
	@IBOutlet private var lableCell: UILabel!
	
	func configure(imageName: String?, title: String) {
		imageCell.image = UIImage(named: "logoVK")
		lableCell.text = title
	}
}

