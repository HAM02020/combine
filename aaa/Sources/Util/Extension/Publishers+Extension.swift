//
//  Publishers+Extension.swift
//  RealmDemo
//
//  Created by my on 2023/7/30.
//

import UIKit
import Combine

extension Publishers{
    private final class UIControlSubscription<S:Subscriber,Control: UIControl>:Subscription where S.Input == Control, S.Failure == Never{
        
        private var subcriber: S?
        private let control: Control
        private let event: UIControl.Event
        
        init(subcriber: S, control: Control, event: UIControl.Event) {
            self.subcriber = subcriber
            self.control = control
            self.event = event
            
        }
        
        func request(_ demand: Subscribers.Demand) {
            
        }
        
        func cancel() {
            subcriber = nil
        }
        func subcribe(){
            control.addTarget(self, action: #selector(handleEvent), for: event)
        }
        @objc func handleEvent(){
            _ = subcriber?.receive(control)
        }

    }
    
    
}

extension Publishers{
    private final class UIControlPublisher<Control:UIControl>: Publisher{
        typealias Output = Control
        typealias Failure = Never
        
        let control: Control
        let event: UIControl.Event
        
        init(control: Control, event: UIControl.Event) {
            self.control = control
            self.event = event
        }
        
        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Control == S.Input {
            let subscription = UIControlSubscription(subcriber: subscriber, control: control, event: event)
            subscriber.receive(subscription: subscription)
        }
        
        
        
        
    }
}
