# Coex

> Coex comes from Coexistence and is a lightweight Swift library & syntactic sugar for async (GCD) operations

## Usage

You can also use `Coex.async(...)` instead of `async(...)`.

### `DispatchQueue` Types

* `main`
* `background`
* `utility`
* `userInitiated`
* `userInteractive`
* `custom`

### `DispatchQueue` Syntactic Sugar

Running a block of code in a specific DispatchQueue. _Default is `.main`._

||BECOMES|
|:--|:--|
|`DispatchQueue.<queue>.async { }` | `async(.<queue>) { }` |
|`DispatchQueue.main.async { }` | `async(.main) { }` <br>  `async { }` (_`.main` is default)_|
| `DispatchQueue.global(qos:  .background).async { }` | `async(.main, after: 3.0) { }` |

### Async After

Executing a block of code after a specific time (in seconds). _Default is `nil`._

||BECOMES|
|:--|:--|
|`DispatchQueue.<queue>.asyncAfter(deadline: .now() + 3.0) { }` | `async(.<queue>, after: 3.0) { }` |
| `DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { }` | `async(.main, after: 3.0) { }` |

---

## Install

### Swift Package Manager

Add the following as a dependency to your `Package.swift`:

```
.package(url: "https://github.com/chryb/coex.git", .exact("1.0.0"))
```

### Carthage

Insert the following into your `Cartfile`:

```
github 'chryb/coex'
```

### Cocoapods

Add the following to your `Podspec`:

```
use_frameworks!
pod "Coex"
```

---

## License

Just MIT. See [LICENSE](./LICENSE).
