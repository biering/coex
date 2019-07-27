import Foundation

public struct Coex {

    public enum Queue {
        case main
        case userInteractive
        case userInitiated
        case utility
        case background
        case custom(queue: DispatchQueue)

        var queue: DispatchQueue {
            switch self {
            case .main: return .main
            case .userInteractive: return .global(qos: .userInteractive)
            case .userInitiated: return .global(qos: .userInitiated)
            case .utility: return .global(qos: .utility)
            case .background: return .global(qos: .background)
            case .custom(let q): return q
            }
        }
    }

    public static func async(_ queue: Queue = .main, after seconds: Double? = nil, _ block: @escaping () -> Void) {
        if let seconds = seconds {
            queue.queue.asyncAfter(deadline: .now() + seconds, execute: block)
        } else {
            queue.queue.async(execute: block)
        }
    }
}

public func async(_ queue: Coex.Queue = .main, after seconds: Double? = nil, _ block: @escaping () -> Void) {
    Coex.async(queue, after: seconds, block)
}

