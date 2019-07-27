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
|`DispatchQueue`<br>`.<queue>`<br>`.async { ... }` | `async(.<queue>) { ... }` |
|`DispatchQueue`<br>`.main`<br>`.async { ... }` | `async(.main) { ... }` <br> .main is default: `async { ... }`|
| `DispatchQueue`<br>`.global(qos: .background)`<br>`.async { ... }` | `async(.main, after: 3.0) { ... }` |

### Async After

Executing a block of code after a specific time (in seconds). _Default is `nil`._

||BECOMES|
|:--|:--|
|`DispatchQueue.<queue>.asyncAfter(deadline: .now() + 3.0) { ... }` | `async(.<queue>, after: 3.0) { ... }` |
| `DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { ... }` | `async(.main, after: 3.0) { ... }` |

## Install

## License

Just MIT. See [LICENSE](./LICENSE).
