# PromiseKit 6.0 

```
let promiseSample = Promise<Any> { seal in
      seal.fulfill(10)
 }
 
```
Here seal is the promise resolver object

```
_ = promiseSample.then({ (index) -> Promise<Int> in
     return Promise<Int> { seal in
          seal.fulfill(12)
     }
}).done({ (index) in
     print(index)
})

```

in here from promiseSample we get the values

then -> used only when we return the promise
done -> finished with the resolve the promise and want a value


src: 
* https://github.com/mxcl/PromiseKit/blob/master/Documentation/GettingStarted.md
* http://promisekit.org/news/2018/02/PromiseKit-6.0-Released/
