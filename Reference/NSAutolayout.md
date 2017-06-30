# Auto Layout

The auto layout can be done in three ways

* Layout Anchors
* NSAutoLayout init function
* NSAutoLayout Visual constraints

src: https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/ProgrammaticallyCreatingConstraints.html#//apple_ref/doc/uid/TP40010853-CH16-SW1

NSAutoLayout is pretty much easy and it can be done through

                 NSLayoutConstraint(item: myView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
