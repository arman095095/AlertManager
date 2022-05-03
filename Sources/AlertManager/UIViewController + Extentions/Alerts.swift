//
//  File.swift
//  
//
//  Created by Арман Чархчян on 13.04.2022.
//

import UIKit

extension UIViewController {
    
    private enum AlertStrings: String {
        case okButtonTitle = "Хорошо"
        case cancelButtonTitle = "Отмена"
        
        enum Recover: String {
            case alertTitle = "Не удалось выполнить вход"
            case alertMessage = "Вы удалили профиль"
            case acceptButtonTitle = "Восстановить"
        }
        
        enum Remove: String {
            case alertTitle = "Удалить профиль"
            case alertMessage = "Вы действительно хотите удалить профиль?"
            case acceptButtonTitle = "Удалить"
        }
        
        enum Logout: String {
            case alertTitle = "Покинуть аккаунт"
            case alertMessage = "Вы действительно хотите выйти?"
            case acceptButtonTitle = "Выйти"
        }
        
        enum Delete: String {
            case alertTitle = "Вы уверены?"
            case alertMessage = "Хотите удалить этот пост?"
            case acceptButtonTitle = "Удалить"
        }
    }
    
    public func showAlertDelete(acceptHandler: @escaping (() -> Void),
                                denyHandler: @escaping (() -> Void)) {
        showAlertDestructive(title: AlertStrings.Delete.alertTitle.rawValue, message: AlertStrings.Delete.alertMessage.rawValue, acceptButtonTitle: AlertStrings.Delete.acceptButtonTitle.rawValue, cancelButtonTitle: AlertStrings.cancelButtonTitle.rawValue, acceptHandler: acceptHandler,
                             denyHandler: denyHandler)
    }
    
    public func showAlertForRecover(acceptHandler: @escaping (() -> Void),
                                    denyHandler: @escaping (() -> Void)) {
        showAlertDefault(title: AlertStrings.Recover.alertTitle.rawValue,
                         message: AlertStrings.Recover.alertMessage.rawValue,
                         acceptButtonTitle: AlertStrings.Recover.acceptButtonTitle.rawValue,
                         cancelButtonTitle: AlertStrings.cancelButtonTitle.rawValue,
                         acceptHandler: acceptHandler,
                         denyHandler: denyHandler)
    }
    
    public func showAlertForLogout(acceptHandler: @escaping (() -> Void),
                                   denyHandler: @escaping (() -> Void)) {
        showAlertDestructive(title: AlertStrings.Logout.alertTitle.rawValue,
                             message: AlertStrings.Logout.alertMessage.rawValue,
                             acceptButtonTitle: AlertStrings.Logout.acceptButtonTitle.rawValue,
                             cancelButtonTitle: AlertStrings.cancelButtonTitle.rawValue,
                             acceptHandler: acceptHandler,
                             denyHandler: denyHandler)
    }
    
    public func showAlertForRemove(acceptHandler: @escaping (() -> Void),
                                   denyHandler: @escaping (() -> Void)) {
        showAlertDestructive(title: AlertStrings.Remove.alertTitle.rawValue,
                             message: AlertStrings.Remove.alertMessage.rawValue,
                             acceptButtonTitle: AlertStrings.Remove.acceptButtonTitle.rawValue,
                             cancelButtonTitle: AlertStrings.cancelButtonTitle.rawValue,
                             acceptHandler: acceptHandler,
                             denyHandler: denyHandler)
    }
    
    public func showAlertDefault(title: String,
                                 message: String,
                                 acceptButtonTitle: String,
                                 cancelButtonTitle: String,
                                 acceptHandler: @escaping (() -> Void),
                                 denyHandler: @escaping (() -> Void)) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: acceptButtonTitle,
                                         style: .default) { _ in
            acceptHandler()
        }
        let cancelAction = UIAlertAction(title: cancelButtonTitle,
                                         style: .default) { _ in
            denyHandler()
        }
        alert.addAction(cancelAction)
        alert.addAction(acceptAction)
        present(alert, animated: true, completion: nil)
    }
    
    public func showAlertDestructive(title: String,
                                     message: String,
                                     acceptButtonTitle: String,
                                     cancelButtonTitle: String,
                                     acceptHandler: @escaping (() -> Void),
                                     denyHandler: @escaping (() -> Void)) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: acceptButtonTitle,
                                         style: .destructive) { _ in
            acceptHandler()
        }
        let cancelAction = UIAlertAction(title: cancelButtonTitle,
                                         style: .default) { _ in
            denyHandler()
        }
        alert.addAction(cancelAction)
        alert.addAction(acceptAction)
        present(alert, animated: true, completion: nil)
    }
    
    public func showAlert(title: String,
                          message: String,
                          completion: @escaping (() -> ()) = { }) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let actionOk = UIAlertAction(title: AlertStrings.okButtonTitle.rawValue,
                                     style: .default) { _ in
            completion()
        }
        alert.addAction(actionOk)
        present(alert, animated: true, completion: nil)
    }
}
