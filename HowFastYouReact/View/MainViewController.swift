//
//  MainViewController.swift
//  HowFastYouReact
//
//  Created by plsystems on 2023/03/13.
//

import Foundation
import UIKit
import Then
import SnapKit
import RxSwift

final class MainViewController: UIViewController, ViewAttribute {
    let viewModel = MainViewModel()
    let disposeBag = DisposeBag()
    let fontManager = FontManager.shared
    
    var index : Int = 0
    lazy var fullCoverageButton = UIButton().then {
        
        $0.backgroundColor = .systemGray
    }
    lazy var promptLabel = UILabel().then {
        
        $0.text = "How fast is your reaction"
        $0.textColor = .white
        $0.font = fontManager.getFont(Font.Bold.rawValue).extraLargeFont
        $0.sizeToFit()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAttributes()
        setUpControl()
    }
    
    func setUI() {
        
        self.view.addSubview(fullCoverageButton)
        
        self.fullCoverageButton.addSubview(promptLabel)
    }
    
    func setAttributes() {
        
        fullCoverageButton.snp.makeConstraints {
            
            $0.edges.equalToSuperview()
        }
        promptLabel.snp.makeConstraints {
            
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setUpControl() {
        
        fullCoverageButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.promptLabel.text = "Get ready..."
                
                switch self?.index {
                case 0:
                    self?.fullCoverageButton.backgroundColor = .systemBlue
                case 1:
                    self?.fullCoverageButton.backgroundColor = .systemRed
                default:
                    break
                }
                self?.viewModel.startTest()
            })
            .disposed(by: disposeBag)
    }
        
}
