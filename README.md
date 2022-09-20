# Sample Tuist project
Simple project to explore tuist for generating and managing dependencies

# Dependency graph
![Dependency Graph](./graph.png?raw=true "Dependency graph")

## Project setup

Make sure you have bundler installed.

```bash
./setup.sh
```

This will install Carthage and Tuist as well as generate project files.

## Tuist

Tuist uses [SwiftGen](https://github.com/SwiftGen/SwiftGen) to generate type safe code for accessing resources. When adding a resource you need to run `tuist generate`.

#### Strings

Strings are located in the `Module/Resources/Strings` folder. Each Module has its own `.strings` file. For example when creating new UI module `Foo` string will be located in `Foo/Resources/Strings/Foo.strings`.


Foo.strings
```
"foo_ScreenTitle" = "Foo";
```

You can access these strings in project using `UIStrings` type:

```swift
label.text = UIStrings.Foo.fooScreenTitle
```

#### Other assets

Similar to strings other assets like colors, fonts and images will be accessible through swift type.