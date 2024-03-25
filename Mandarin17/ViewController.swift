//
//  ViewController.swift
//  Mandarin17
//
//  Created by S0meyosh1no on 25/03/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jailbreakButton: UIButton!
    var loadingView: UIView?
    var activityIndicator: UIActivityIndicatorView?
    let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()


        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 84/255, green: 150/255, blue: 255/255, alpha: 1).cgColor,
            UIColor(red: 84/255, green: 255/255, blue: 138/255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
        

        jailbreakButton.addTarget(self, action: #selector(jailbreakButtonTapped), for: .touchUpInside)
    }

    @objc func jailbreakButtonTapped() {

        showLoadingView()

        jailbreakButton.setTitle("Jailbreaking...", for: .normal)

        print("Hello")
        

        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {

            self.hideLoadingView()

            self.jailbreakButton.setTitle("Jailbroken", for: .normal)
            

            self.showSuccessAlert()
        }
    }
    
    func showLoadingView() {

        loadingView = UIView(frame: view.bounds)
        loadingView?.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.center = loadingView!.center
        activityIndicator?.startAnimating()
        
        loadingView?.addSubview(activityIndicator!)
        view.addSubview(loadingView!)
    }
    
    func hideLoadingView() {

        activityIndicator?.stopAnimating()
        loadingView?.removeFromSuperview()
    }
    
    func showSuccessAlert() {
        let alert = UIAlertController(title: "Success?", message: "Press OK to respring", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
                // respring but, not ballpa1n belive me
                guard let window = UIApplication.shared.windows.first else { return }
                while true {
                    window.snapshotView(afterScreenUpdates: false)
                }
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
