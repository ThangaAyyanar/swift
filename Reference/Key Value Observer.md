# simple implementation of Key Value Observer

### Configuration.swift
```
import Foundation

class Configuration: NSObject {

    // MARK: - Properties
    
    dynamic var createdAt = Date()
    dynamic var updatedAt = Date()
}
```

### ConfigurationManager.swift
```

import UIKit

class ConfigurationManager: NSObject {

    // MARK: - Properties
    var configuration: Configuration

    // MARK: -
    lazy private var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
        return dateFormatter
    }()

    // MARK: -
    var createdAt: String {
        return dateFormatter.string(from: configuration.createdAt)
    }

    var updatedAt: String {
        return dateFormatter.string(from: configuration.updatedAt)
    }

    // MARK: - Initialization
    init(withConfiguration configuration: Configuration) {
        self.configuration = configuration

        super.init()
    }

    // MARK: - Public Interface
    func updateConfiguration() {
        configuration.updatedAt = Date()
    }

}

```

### ViewController.swift

```


import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet var timeLabel: UILabel!

    // MARK: -
    let configurationManager = ConfigurationManager(withConfiguration: Configuration())

    // MARK: - Deinitialization
    deinit {
        removeObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt))
    }

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt), options: [.old, .new, .initial], context: nil)
    }

    // MARK: - Actions
    @IBAction func updateConfiguration(sender: UIButton) {
        configurationManager.updateConfiguration()
    }

    // MARK: - Key-Value Observing
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(configurationManager.configuration.updatedAt) {
            // Update Time Label
            timeLabel.text = configurationManager.updatedAt
        }
    }

}

```

### Source
```
https://github.com/bartjacobs/KeyValueObservingAndSwift/tree/master/KVO
```
