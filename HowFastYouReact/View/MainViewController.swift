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
import GoogleMobileAds
//import GameKit

final class MainViewController: UIViewController, ViewAttribute, GADBannerViewDelegate {
    let viewModel = MainViewModel()
    let disposeBag = DisposeBag()
    let fontManager = FontManager.shared
    
    let tapGesture1 = UITapGestureRecognizer()
    let tapGesture2 = UITapGestureRecognizer()

//    lazy var leaderboard = GKLeaderboard().then {
//        $0.identifier = "Score_HowFastYou"
//        $0.timeScope = .allTime // or .today or .week
//        $0.playerScope = .global // or .friendsOnly
//
////        $0.range = NSMakeRange(1, 1000) // set the range (optional)
//    }
    
    var index = 1
    var backgroundColor: UIColor = .systemGray
    var reactBool = false
    
    let fullCoverageButton = UIButton()
    lazy var questionMark = UIImageView().then {
        
        $0.isUserInteractionEnabled = true
        $0.tintColor = .white
        $0.image = UIImage(systemName: "questionmark.app.fill")
        $0.addGestureRecognizer(tapGesture1)
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
    lazy var bannerView = GADBannerView().then {
        $0.alpha = 0.0
        // TEST Key    ca-app-pub-3940256099942544/2934735716
        // Release Key ca-app-pub-9690529790943099/3137915569
        $0.adUnitID = "ca-app-pub-9690529790943099/3137915569"
        $0.rootViewController = self
        $0.load(GADRequest())
        $0.delegate = self
    }
    lazy var trophyImageView = UIImageView().then {
        
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
        $0.tintColor = .white
        $0.image = UIImage(systemName: "trophy.fill")
        $0.addGestureRecognizer(tapGesture2)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAttributes()
        setUpControl()
        
//        authLeaderBoard()
    }
    
    func setUI() {
        
        self.view.addSubview(fullCoverageButton)
        
        self.fullCoverageButton.addSubview(questionMark)
        self.fullCoverageButton.addSubview(promptLabel)
        self.fullCoverageButton.addSubview(timerLabel)
        self.fullCoverageButton.addSubview(bannerView)
        self.fullCoverageButton.addSubview(trophyImageView)
    }
    
    func setAttributes() {
        
        questionMark.snp.makeConstraints {
            
            $0.width.height.equalTo(30)
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.right.equalTo(-20)
        }
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
        bannerView.snp.makeConstraints {
            
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-5)
            $0.left.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.right.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(45)
        }
        trophyImageView.snp.makeConstraints {
            
            $0.width.height.equalTo(70)
            $0.right.equalTo(-20)
            $0.bottom.equalTo(bannerView.snp.top).offset(-30)
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
                    self?.trophyImageView.alpha = 0.0 // 2차 배포 0.0 => 1.0
                    
                case 2:
                    self?.viewModel.startTimer()
                    
                    self?.promptLabel.text = "화면이 녹색으로 변하면 터치해주세요".localized()
                    self?.backgroundColor = .systemOrange
                    self?.trophyImageView.alpha = 0.0
                    
                case 3:
                    self?.viewModel.stopWatchStart()
                    self?.backgroundColor = .systemGreen
                    self?.trophyImageView.alpha = 0.0
                    
                case 4:
                    self?.viewModel.stopTimer()
                    
                    self?.promptLabel.text = "화면이 녹색으로 변하면 터치해주세요\n터치하여 재시도".localized()
                    self?.backgroundColor = .systemRed
                    self?.trophyImageView.alpha = 0.0
                    
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
                    
                    // MARK: - GameCenter 등록 2차 배포
//                    self?.viewModel.elapsedTime
//                        .subscribe(onNext: { scoreValue in
//                            self?.loadScores(reactScore: scoreValue)
//                        })
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
        
        // MARK: - 물음표 터치
        tapGesture1.rx.event
            .subscribe(onNext: { [weak self] _ in
                self?.goNextPage("profile")
            })
            .disposed(by: disposeBag)
        
        // MARK: - 랭킹 터치
        tapGesture2.rx.event
            .subscribe(onNext: { [weak self] _ in
                self?.goNextPage("rank")
            })
            .disposed(by: disposeBag)
        
    }
    
    func goNextPage(_ handler: String) {
        switch handler {
        case "profile" :
            self.navigationController?.pushViewController(ProfileViewController(), animated: true)

        case "rank" :
//            self.navigationController?.pushViewController(GameCenterViewController(), animated: true)
//            authLeaderBoard()
            break

        default:
            break
        }
    }
    
//    func authLeaderBoard() {
//        traceLog("")
//
//        GKLocalPlayer.local.authenticateHandler = { (viewController, error) in
//          if let error = error {
//            print("Authentication failed: \(error.localizedDescription)")
//          } else if let viewController = viewController {
//            // present the view controller to authenticate the player
//            self.present(viewController, animated: true, completion: nil)
//          } else {
//            print("Authentication succeeded!")
//          }
//        }
//    }
    
//    func loadScores(reactScore: Double) {
//        traceLog("\(reactScore)")
//
//        let score = GKScore(leaderboardIdentifier: "Score_HowFastYou")
//        score.value = Int64(reactScore)
//        GKScore.report([score], withCompletionHandler: { (error) in
//          if let error = error {
//            print("Error submitting score: \(error.localizedDescription)")
//          } else {
//            print("Score submitted!")
//          }
//        })
//    }
}
