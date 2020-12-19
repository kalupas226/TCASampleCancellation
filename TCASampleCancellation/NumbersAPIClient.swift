import Combine
import ComposableArchitecture
import Foundation

struct NumbersAPIClient {
    var trivia: (Int) -> Effect<String, TriviaApiError>

    struct TriviaApiError: Error, Equatable {}
}

extension NumbersAPIClient {
    static let live = NumbersAPIClient(
        trivia: { number in
            URLSession.shared.dataTaskPublisher(for: URL(string: "http://numbersapi.com/\(number)/trivia")!)
                .map { data, _ in String.init(decoding: data, as: UTF8.self) }
                .catch { _ in
                    Just("\(number) is a good number Brent")
                        .delay(for: 1, scheduler: DispatchQueue.main)
                }
                .mapError { _ in TriviaApiError() }
                .eraseToEffect()
        })
}
