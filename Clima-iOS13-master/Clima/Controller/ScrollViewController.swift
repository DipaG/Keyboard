//
//  ScrollViewController.swift
//  Clima
//
//  Created by mx on 10/12/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {
    var activeTextField : UITextField?
    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboadShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc
    func keyboadShow(notification:NSNotification){
        print(scrollView.contentInset)
        let userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.top = (scrollView.frame.size.height - (activeTextField?.frame.origin.y)! - (activeTextField?.frame.size.height)!) - 346
        scrollView.contentInset = contentInset

    }
    @objc
    func keyboardHide(notification: NSNotification){
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.top = 0
        scrollView.contentInset = contentInset
    }

}
extension ScrollViewController: UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeTextField = textField
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        activeTextField!.resignFirstResponder()
        activeTextField = nil
        return true
    }
}
