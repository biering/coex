# Coex

> A lightweight Swift library & syntactic sugar for async (GCD) operations

---

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

### Carthage

Insert the following into your `Cartfile`:

```
github 'chryb/coex'
```

### Cocoapods

---

## License

Just MIT. See [LICENSE](./LICENSE).
