import Combine
import ComposableArchitecture
import Foundation
import SwiftUI
import UIKit

final class EffectsCancellationViewController: UIViewController {
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var triviaLabel: UILabel!
    @IBOutlet private weak var apiButton: UIButton!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    private let viewStore: ViewStore<EffectsCancellationState, EffectsCancellationAction>
    private var cancellables: Set<AnyCancellable> = []

    init(store: Store<EffectsCancellationState, EffectsCancellationAction>) {
        self.viewStore = ViewStore(store)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.startAnimating()

        viewStore.publisher
            .map { "\($0.count)" }
            .assign(to: \.text, on: numberLabel)
            .store(in: &cancellables)

        viewStore.publisher.currentTrivia
            .assign(to: \.text, on: triviaLabel)
            .store(in: &cancellables)

        viewStore.publisher.sink { [weak self] state in
            let buttonTitle = state.isTriviaRequestInFlight ? "Cancel" : "NumberFact"
            self?.apiButton.setTitle(buttonTitle, for: .normal)
        }.store(in: &cancellables)

        viewStore.publisher
            .map { $0.isTriviaRequestInFlight ? false : true }
            .assign(to: \.isHidden, on: activityIndicator)
            .store(in: &cancellables)
    }

    @IBAction private func tapStepper(stepper: UIStepper) {
        viewStore.send(.stepperChanged(Int(stepper.value)))
    }

    @IBAction private func tapAPIButton(_ sender: Any) {
        if viewStore.isTriviaRequestInFlight {
            viewStore.send(.cancelButtonTapped)
        } else {
            viewStore.send(.triviaButtonTapped)
        }
    }
}

struct EffectsCancellationViewControllerWrapper: UIViewControllerRepresentable {
    let store: Store<EffectsCancellationState, EffectsCancellationAction>

    init(store: Store<EffectsCancellationState, EffectsCancellationAction>) {
        self.store = store
    }

    typealias UIViewControllerType = EffectsCancellationViewController

    func makeUIViewController(context: Context) -> EffectsCancellationViewController {
        return EffectsCancellationViewController(store: store)
    }

    func updateUIViewController(_ uiViewController: EffectsCancellationViewController, context: Context) {}
}
