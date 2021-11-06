## Screen

### Home Screen
- First Screen in the app
- CollectionView with HomeScreenCell as CollectionViewCell
- Transition animation from HomeScreen to DetailScreen using PopAnimator

### Detail Screen
- These Screen is split into three views

#### Detail Screen Top View
- Contains the AppImage, AppName, AppDescription and Close Button

#### Detail Screen Mid View
- Contains the Screen shoot View
- Implemented using collection view with DetailScreenShotView as CollectionViewCell

#### Detail Screen Bottom View
- Contains Download button and download animation

### Bottom Sheet View
- View appear after the PLAY button is tapped
- Components which helps build BottomSheet
    - Profile Component
    - Wallet Component
    - Payment Component
