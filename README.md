# Anchora
A small framework that abstracts over UIKit's Auto Layout engine in a native style to tidy up your constraints.

## Usage

Each constraint is a linear equation with the following format:
```
item1.attribute1 = multiplier * item2.attribute2 + constant
```

Anchora makes use of this equation to provide a convenient and intuitive way of building constraints in a native style.

Single constraints are constructed using the following methods: `equals(_:)`, `lessOrEquals(_:)`, `greaterOrEquals(_:)`, 
each of which represents a layout relation and takes a single expression of the following format, where `multiplier` and `constant` are optional:
```
anchor [* or /] multiplier [+ or -] constant
```

For instance,

``` swift
view1.centerXAnchor.equals(view2.centerXAnchor * 2 + 10)

view1.rightAnchor.lessOrEquals(view2.leftAnchor - 8)

view1.heightAnchor.equals(view2.heightAnchor)
```

As an exception, `NSLayoutDimension` constraints can simply take a number.
``` swift
view.widthAnchor.equals(80)
```

### Anchor Groups

Apart from the existing anchors we all know, Anchora comes with some built-in anchor groups that serve a great means
of brevity when constructing several related constraints at once. The order in the list of anchors a group represents matters!

* `centerAnchors` == (`centerXAnchor`, `centerYAnchor`)
* `sizeAnchors` == (`widthAnchor`, `heightAnchor`)
* `edgeAnchors` == (`topAnchor`, `leftAnchor`, `bottomAnchor`, `rightAnchor`)


The `constrain(...)` method allows to create constraints by associating a set of individual anchors to their equivalents
in the anchor group, while `equal(_:)` is the bulk variant of `equals(_:)` for an individual anchor.

```swift 
view1.edgeAnchors.equal(view2.edgeAnchors)

// Equivalent to
view1.topAnchor.equals(view2.topAnchor)
view1.leftAnchor.equals(view2.leftAnchor)
view1.bottomAnchor.equals(view2.bottomAnchor)
view1.rightAnchor.equals(view2.rightAnchor)
```
```swift
view1.sizeAnchors.equal(100)

// Equivalent to
view1.widthAnchor.equals(100)
view1.heightAnchor.equals(100)
```
```swift
view1.centerAnchors.constrain(view2.centerXAnchor - 10, view2.centerYAnchor) 

// Equivalent to
view1.centerXAnchor.equals(view2.centerXAnchor - 10)
view1.centerYAnchor.equals(view2.centerYAnchor)
```
___

For convenience, Anchora methods return discardable active constraints. If you need an inactive constraint, use `inactive()`.
``` swift
let constraint = view1.rightAnchor.equals(view2.leftAnchor - 8).inactive()
```

## Requirements

* Xcode 9 +
* Swift 4 +
* iOS 10 +

## Installation

You can integrate Anchora with [CocoaPods](https://cocoapods.org/). Add it to your `Podfile` and run `$ pod install`.

``` ruby
platform :ios, '10.0'
use_frameworks!

target '<Your Target>' do
    pod 'Anchora'
end
```
