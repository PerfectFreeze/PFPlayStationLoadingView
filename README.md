# PFPlayStationLoadingView

A cute loading indicator just like the new PlayStation app's way. It provides two different indicator styles.

## Screenshot

![Demo](Screenshot.gif)

You can open the sample project and take a brief look :)

## Installation

### Using Carthage

TODO.

### Using CocoaPods

Add `PFPlayStationLoadingView` to your `Podfile`:

```ruby
pod 'PFPlayStationLoadingView'
```

Run `pod install` to install this framework.

### Manually

Drag `Classes` folder to your project.

## Usage 

```objective-c
// Type: PFPlayStationLoadingViewTypeSquare & PFPlayStationLoadingViewTypeHorizontal
// It would use frame's origin (100) and sideLength (40) to calculate frame's size.
PFPlayStationLoadingView *view = [[PFPlayStationLoadingView alloc] initWithFrame:CGRectMake(100, 100, 0, 0)
                                                                      sideLength:40
                                                               	            type:PFPlayStationLoadingViewTypeSquare];
[self.view addSubview:view];

// Start animating
[view startAnimating];

// Stop animating
[view stopAnimating];

// Check status
BOOL isAnimating = [view isAnimating];
```

## License

This project is released under the terms and conditions of the [MIT license](https://opensource.org/licenses/MIT). See [LICENSE](LICENSE) for details.