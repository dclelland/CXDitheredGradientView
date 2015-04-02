# CXDitheredGradientView
Ultra-basic UIView subclass. Draws using CGGradient, which supports dithering to avoid banding artefacts.

```objc
CXDitheredGradientView *gradientView = [[CXDitheredGradientView alloc] initWithFrame:self.view.bounds];

gradientView.colors = @[[UIColor redColor], [UIColor whiteColor], [UIColor blueColor]];

[self.view addSubview:gradientView];
```
