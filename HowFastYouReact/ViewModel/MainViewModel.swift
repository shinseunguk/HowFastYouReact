//
//  MainViewModel.swift
//  HowFastYouReact
//
//  Created by plsystems on 2023/03/13.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

final class MainViewModel {
    var disposeBag = DisposeBag()
    
    // 1, 최초화면 SystemGray
    // 2, 준비화면 -> SystemBlue , 준비화면에서 터치 -> 4
    // 3, 초록색이후 터치 -> 초록색 이후에 터치(정상), 기록 보여주기
    // 4, 빨간색이후 터치 -> 준비화면으로 다시 이동
    var startReact = BehaviorSubject<Int>(value: 1)
    let timerValue = BehaviorRelay<Int>(value: 1)
    
    let progressStatus = BehaviorRelay<Float>(value: 0.0)
    
    let elapsedTime = BehaviorRelay<Double>(value: 0.0)
    
    let totalScoreObserver = BehaviorRelay<Double>(value: 0.0)
    private var stopWatch: Disposable?
    private var timer: Disposable?
        
    func stopWatchStart() {
        let startTime = Date().timeIntervalSince1970 - elapsedTime.value
        stopWatch = Observable<Int>.interval(.milliseconds(10), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                let currentTime = Date().timeIntervalSince1970
                let elapsedTime = currentTime - startTime
                self?.elapsedTime.accept(elapsedTime)
            })
    }
    
    func stopWatchStop() {
        stopWatch?.dispose()
    }
    
    func stopWatchReset() {
        elapsedTime.accept(0.0)
    }
    
    func startTimer() {
        // Prompt the user to get ready
        // Start the test after a random delay between 4 and 6 seconds
        let delay = Double.random(in: 4...7)
        timer = Observable<Int>.timer(.seconds(Int(delay)), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] value in
                
                self?.timerValue.accept(value)
                self?.startReact.onNext(3)
            })
    }
    
    func stopTimer() {
        timerValue.accept(1)
        timer?.dispose()
    }
    
    func progressBarStatus() {
        let index = progressStatus.value
        
        switch index {
        case 0.0 :
            traceLog("\(index)")
            progressStatus.accept(0.3)
            break
        case 0.3 :
            traceLog("\(index)")
            progressStatus.accept(0.6)
            break
        case 0.6 :
            traceLog("\(index)")
            progressStatus.accept(1.0)
            break
        case 1.0 :
            traceLog("\(index)")
            progressStatus.accept(0.0)
            break
        default:
            break
        }
    }
}
