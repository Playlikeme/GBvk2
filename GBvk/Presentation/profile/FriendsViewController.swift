//
//  FriendsViewController.swift
//  GBvk
//
//  Created by Роман Михайлов on 19.08.2021.
//

import UIKit

class FriendsViewController: UIViewController {

	@IBOutlet var tableView: UITableView!
	
	let friends = ["Роман", "Дарья", "София"]
	
	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self

    }
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		friends.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: FriendsCellTableViewCell.identifier) as! FriendsCellTableViewCell
		cell.configure(imageName: "logoVK", title: friends[indexPath.row])
		return cell
	}
	
	}
	
	
