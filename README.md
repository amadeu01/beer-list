#  iOS App to show a List of Beers


## How to run
Clone the project

```bash
git clone https://github.com/amadeu01/beer-list.git Beer
cd Beer
carthage update --platform iOS
open Beer\ List.xcodeproj
```


### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

Run `carthage update` to build the frameworks.

### Playground

If you want to check out some stuff, you could go to playground and see the Views and play around. However, first, check if you had already built the Beer-List-ios-Playground.

If you want to try something new or just check something, you could go to `_ScratchWork` and check some of the code. Or, try new implementations of something.

You can also change the 'device' view or orientation on playground by changing the enum.

```swift

public enum Device { // Type of devices
case phone3_5inch
case phone4inch
case phone4_7inch
case phone5_5inch
case pad
case pad12_9inch
}

public enum Orientation { // Orientations
case portrait
case landscape
}

```

```swift

let (parent, _) = playgroundControllers(device: .phone4inch, orientation: .portrait, child: navigationController)

```
