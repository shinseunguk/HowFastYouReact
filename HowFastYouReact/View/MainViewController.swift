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
import RxCocoa

final class MainViewController: UIViewController, ViewAttribute {
    let viewModel = MainViewModel()
    let disposeBag = DisposeBag()
    let fontManager = FontManager.shared

    var index = 1
    var backgroundColor: UIColor = .systemGray
    var reactBool = false
    
    lazy var fullCoverageButton = UIButton().then {
        
        $0.backgroundColor = .systemGray
    }
    lazy var promptLabel = UILabel().then {
        
        $0.text = "반응속도 테스트".localized()
        $0.font = fontManager.getFont(Font.Bold.rawValue).extraLargeFont
        $0.sizeToFit()
        $0.textAlignment = .center
        $0.textColor = .white
        $0.numberOfLines = 0
    }
    lazy var timerLabel = UILabel().then {
        
        $0.alpha = 0.0
        $0.font = .boldSystemFont(ofSize: 40)
        $0.sizeToFit()
        $0.textAlignment = .center
        $0.textColor = .white
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
        self.fullCoverageButton.addSubview(timerLabel)
    }
    
    func setAttributes() {
        
        fullCoverageButton.snp.makeConstraints {
            
            $0.edges.equalToSuperview()
        }
        promptLabel.snp.makeConstraints {
            
            $0.left.equalTo(10)
            $0.right.equalTo(-10)
            $0.height.equalTo(150)
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
        }
        timerLabel.snp.makeConstraints {
            
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func setUpControl() {
        
        // MARK: - BackgroundColor, Text Set
        viewModel.startReact
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] value in
                self?.index = value
                
                switch value {
                case 1:
                    self?.promptLabel.text = "터치하여 테스트 시작!".localized()
                    self?.backgroundColor = .systemBlue
                    
                case 2:
                    self?.viewModel.startTimer()
                    
                    self?.promptLabel.text = "화면이 녹색으로 변하면 터치해주세요".localized()
                    self?.backgroundColor = .systemOrange
                    
                case 3:
                    self?.viewModel.stopWatchStart()
                    self?.backgroundColor = .systemGreen
                    
                case 4:
                    self?.viewModel.stopTimer()
                    
                    self?.promptLabel.text = "화면이 녹색으로 변하면 터치해주세요\n터치하여 재시도".localized()
                    self?.backgroundColor = .systemRed
                    
                default:
                    break
                }
                
                self?.fullCoverageButton.backgroundColor = self?.backgroundColor
            })
            .disposed(by: disposeBag)
        
        // MARK: - 화면 터치
        fullCoverageButton.rx.tap
            .subscribe(onNext: { [weak self] in
                
                switch self?.index {
                case 1: // 초기화면(Blue) -> 준비화면(Orange)
                    self?.viewModel.startReact.onNext(2)
                    self?.viewModel.stopWatchReset()
                    self?.timerLabel.alpha = 0.0
                    
                case 2: // 준비화면(Orange) -> 실패화면(Red)
                    self?.viewModel.startReact.onNext(4)
                    
                case 3: // 지금부터 측정(Green)
                    self?.viewModel.startReact.onNext(1)
                    self?.viewModel.stopWatchStop()
                    self?.timerLabel.alpha = 1.0
                    
                case 4: // 실패화면(Red) -> 준비화면(Orange)
                    self?.viewModel.startReact.onNext(2)
                    
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
        
        // MARK: - 스탑 워치
        viewModel.elapsedTime
            .map {"\(String(format: "%.2f", $0*1000))ms"}
            .bind(to: timerLabel.rx.text)
            .disposed(by: disposeBag)
        
    }
        
}
