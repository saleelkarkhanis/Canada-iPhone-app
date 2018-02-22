//
//  Utilities.swift
//  CanadaInfo
//
//  Created by synerzip on 22/02/18.
//  Copyright © 2018 saleelkarkhanis. All rights reserved.
//

import Foundation
import SVProgressHUD

func showProgressSpinner() {
    DispatchQueue.main.async {
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.setRingThickness(3.0)
        SVProgressHUD.setRingRadius(10)
        SVProgressHUD.setCornerRadius(6)
        SVProgressHUD.setFont(UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1))
        SVProgressHUD.setBackgroundColor(UIColor.darkGray)
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.show()
    }
}

func hideProgressSpinner() {
    //Hide on main thread
    DispatchQueue.main.async {
        SVProgressHUD.dismiss()
    }
}

func showErrorAlertWithMessage(message: String, onViewController vc: UIViewController) {
    let errorAlertController = UIAlertController(title: errorAlertConstants.title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: errorAlertConstants.oKButtonTitle, style: .default, handler: nil)
    errorAlertController.addAction(okAction)
    vc.present(errorAlertController, animated: true, completion: nil)
}
