//
//  TCASampleCancellationApp.swift
//  TCASampleCancellation
//
//  Created by Aikawa Kenta on 2020/12/16.
//
import ComposableArchitecture
import SwiftUI

@main
struct TCASampleCancellationApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                List {
                    NavigationLink(
                        "SwiftUIView",
                        destination: EffectsCancellationView(
                            store: Store(
                                initialState: EffectsCancellationState(),
                                reducer: effectsCancellationReducer,
                                environment: EffectsCancellationEnvironment(
                                    mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
                                    numbersClient: NumbersAPIClient.live
                                )
                            )
                        )
                    )
                    
                    NavigationLink(
                        "UIKitView",
                        destination: EffectsCancellationViewControllerWrapper(
                            store: Store(
                                initialState: EffectsCancellationState(),
                                reducer: effectsCancellationReducer,
                                environment: EffectsCancellationEnvironment(
                                    mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
                                    numbersClient: NumbersAPIClient.live
                                )
                            )
                        )
                    )
                }
                .navigationBarTitle("TCA Sample")
            }
        }
    }
}
