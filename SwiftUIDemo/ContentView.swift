//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by perry on 4/27/20.
//  Copyright © 2020 perry. All rights reserved.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {

    @State private var isUnlocked = false

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // 检查是否可以进行生物特征识别
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // 如果可以，执行识别
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // 鉴权完成
                DispatchQueue.main.async {
                    if success {
                        // 鉴权成功
                        self.isUnlocked = true
                    } else {
                        // 鉴权失败
                    }
                }
            }
        } else {
            // 没有生物指纹识别功能
        }
    }
    
    var body: some View {
        VStack {
            if self.isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
