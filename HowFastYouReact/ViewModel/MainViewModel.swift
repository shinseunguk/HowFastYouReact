//
//  MainViewModel.swift
//  HowFastYouReact
//
//  Created by plsystems on 2023/03/13.
//

import Foundation
import RxSwift
import RxCocoa

final class MainViewModel {
    let disposeBag = DisposeBag()
    
    func startTest() {
        // Prompt the user to get ready
        
        // Start the test after a random delay between 1 and 3 seconds
        let delay = Double.random(in: 1...3)
        Observable<Int>.timer(.seconds(Int(delay)), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                traceLog("")
//                self?.startTimer()
            })
            .disposed(by: disposeBag)
    }
}
