# Random bytes and numbers
Generate random bytes and numbers in Node.js and modern browsers with security in mind.

This small set of functions takes security serious and applies workarounds for JavaScript-specific quirks.

## How to install
```
npm install random-bytes-numbers
```

## How to use
Node.js:
```javascript
var random_bytes_numbers = require('random-bytes-numbers')

// Do stuff
```
Browser:
```javascript
requirejs(['random-bytes-numbers'], function (random_bytes_numbers) {
    // Do stuff
})
```

## List of exported functions
* `random_bytes()`
* `random_int()`
* `random()`

## API
### random_bytes_numbers.random_bytes(size : number) : Uint8Array
Generate random bytes of specified size.

### random_bytes_numbers.random_int(min : number, max : number) : number
Generate random integer from range `[min, max]`.
`max - min` should be less or equal than `Number.MAX_SAFE_INTEGER`, which is 53bits.

### random_bytes_numbers.random() : number
Replacement for `Math.random()` that can be used for cryptographic operations, returns number from range `[0, 1)`.

## Contribution
Feel free to create issues and send pull requests (for big changes create an issue first and link it from the PR), they are highly appreciated!

When reading LiveScript code make sure to configure 1 tab to be 4 spaces (GitHub uses 8 by default), otherwise code might be hard to read.

## License
Free Public License 1.0.0 / Zero Clause BSD License

https://opensource.org/licenses/FPL-1.0.0

https://tldrlegal.com/license/bsd-0-clause-license
