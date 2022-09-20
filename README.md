# Sample Tuist project
Simple project to explore tuist for generating project Targets and managing dependencies

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

Strings are located in the `Module/Resources/Strings` folder. Each Module has its own `.strings` file. For example when creating new UI module `Foo` strings will be located in `Foo/Resources/Strings/Foo.strings`.


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

## Tuist documentation

Useful documentation links to further explore tuist capabilities.

[Bootstraping](https://docs.tuist.io/commands/scaffold)

[µFeatures Architecture](https://docs.tuist.io/building-at-scale/microfeatures)

[Caching](https://docs.tuist.io/building-at-scale/caching)

[Dependency graph generation](https://docs.tuist.io/commands/graph)