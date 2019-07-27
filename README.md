# Coex

> A lightweight Swift library & syntactic sugar for async operations

## Usage

### `DispatchQueue` Types

* main
* background
* utility
* userI..
* userInteractive
* custom

### `DispatchQueue` Syntactic Sugar

Running a block of code in a specific DispatchQueue. _Default is `.main`._

||BECOMES|
|:--|:--|
|`DispatchQueue.<queue>.async {`<br><br>`}` | `async(.<queue>) {`<br><br>`}` |
|`DispatchQueue.main.async {`<br><br>`}` | `async(.main) {`<br><br>`}` <br> .main is default: `async {`<br><br>`}`|
| `DispatchQueue.global(qos: .background).async {`<br><br>`}` | `async(.main, after: 3.0) {`<br><br>`}` |

### Async After

Executing a block of code after a specific time (in seconds). _Default is `nil`._

||BECOMES|
|:--|:--|
|`DispatchQueue.<queue>.asyncAfter(deadline: .now() + 3.0) { ... }` | `async(.<queue>, after: 3.0) { ... }` |
| `DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { ... }` | `async(.main, after: 3.0) { ... }` |

## Install

## License

Just MIT. See [LICENSE](./LICENSE).
