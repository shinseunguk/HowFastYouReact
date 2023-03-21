//
//  GameCenterViewController.swift
//  HowFastYouReact
//
//  Created by plsystems on 2023/03/16.
//

import Foundation
import UIKit
import GameKit

final class GameCenterViewController: UIViewController, ViewAttribute {
    
    override func viewWillAppear(_ animated: Bool) {

        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAttributes()
        setUpControl()
    }
    
    func setUI() {
        
        self.view.backgroundColor = .white
    }
    
    func setAttributes() {
    }
    
    func setUpControl() {
    }
}
