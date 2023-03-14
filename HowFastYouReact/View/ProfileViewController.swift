//
//  ProfileViewController.swift
//  HowFastYouReact
//
//  Created by ukBook on 2023/03/14.
//

import Foundation
import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

final class ProfileViewController: UIViewController, ViewAttribute {
    let fontManager = FontManager.shared
    
    let tapGesture = UITapGestureRecognizer()

    var index = 1
    var backgroundColor: UIColor = .systemGray
    var reactBool = false
    
    lazy var descriptionLabel = UILabel().then {
        
        $0.text = "추가적인 기능 요청 및 개선은 개발자 이메일을 통해 요청 해주시기 바랍니다.\n\n개발자 이메일 - ukseung.dev@gmail.com".localized()
        $0.font = fontManager.getFont(Font.Bold.rawValue).extraLargeFont
        $0.sizeToFit()
        $0.textAlignment = .natural
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        
        self.view.addSubview(descriptionLabel)
    }
    
    func setAttributes() {
        
        descriptionLabel.snp.makeConstraints {
            
            $0.left.equalTo(20)
            $0.right.equalTo(-20)
            $0.height.equalTo(150)
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setUpControl() {
        
    }
}
