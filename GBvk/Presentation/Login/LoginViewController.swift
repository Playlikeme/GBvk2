//
//  LoginViewController.swift
//  GBvk
//
//  Created by Роман Михайлов on 12.08.2021.
//

import UIKit

final class LoginViewController: UIViewController {
	
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var titleImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var loginTexField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//Жест тапа по скроллу
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
		//жест для скролла
		scrollView?.addGestureRecognizer(tapGesture)
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		// Подписываемся на два уведомления: одно приходит при появлении клавиатуры
		NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
		// Второе — когда она пропадает
		NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
	@IBAction func logout(_ segue: UIStoryboard) {
		loginTexField.text = ""
		passwordTextField.text = ""
	}

	
    @IBAction private func loginButtonPassed(_ sender: UIButton) {
		let loginText = loginTexField.text
			//получаем пороль
			let passwordText = passwordTextField.text
			
			if loginText == "123" && passwordText == "123" {
			} else {
		  // Создаем контроллер
		  let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
		  // Создаем кнопку для UIAlertController
		  let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
		  // Добавляем кнопку на UIAlertController
		  alert.addAction(action)
		  // Показываем UIAlertController
		  present(alert, animated: true, completion: nil)
		  
	  }

		
    }
	
	@objc func hideKeyboard() {
		self.scrollView?.endEditing(true)
	}
	
	// Когда клавиатура появляется
	@objc func keyboardWasShown(notification: Notification) {
		
		// Получаем размер клавиатуры
		let info = notification.userInfo! as NSDictionary
		let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
		let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
		
		// Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
		self.scrollView?.contentInset = contentInsets
		scrollView?.scrollIndicatorInsets = contentInsets
	}
	
	//Когда клавиатура исчезает
	@objc func keyboardWillBeHidden(notification: Notification) {
		// Устанавливаем отступ внизу UIScrollView, равный 0
		let contentInsets = UIEdgeInsets.zero
		scrollView?.contentInset = contentInsets
		scrollView?.scrollIndicatorInsets = contentInsets
	}
	
}
