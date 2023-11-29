//
//  ExtensionViewController.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/27/23.
//

import UIKit

class ExtensionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension UIViewController{
    class func displaySpinner(onView: UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = .black.withAlphaComponent(0.5)
        
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        return spinnerView
    }
    
    class func removeSpinner(spinner: UIView){
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
    
    class func displaySpinnerCollection(onView: UICollectionView) -> UIView {
        print("display spinner!!!!")
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = .black.withAlphaComponent(0.5)
        
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        return spinnerView
    }
}
