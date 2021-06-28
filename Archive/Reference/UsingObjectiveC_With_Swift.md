# ADDING A SWIFT BRIDGING HEADER

* Add a new file to Xcode (File > New > File), then select “Source” and click “Header File“.
* Name your file “YourProjectName-Bridging-Header.h”.  Example: In my app Station, the file is named “Station-Bridging-Header”.
* Create the file.
* Navigate to your project build settings and find the “Swift Compiler – Code Generation” section.  You may find it faster to type in “Swift Compiler” into the search box to narrow down the results.  Note: If you don’t have a “Swift Compiler – Code Generation” section, this means you probably don’t have any Swift classes added to your project yet.  Add a Swift file, then try again.
* Next to “Objective-C Bridging Header” you will need to add the name/path of your header file.  If your file resides in your project’s root folder simply put the name of the header file there.  Examples:  “ProjectName/ProjectName-Bridging-Header.h” or simply “ProjectName-Bridging-Header.h”.
* Open up your newly created bridging header and import your Objective-C classes using #import statements.  
  Any class listed in this file will be able to be accessed from your swift classes.
  
src: http://www.learnswiftonline.com/getting-started/adding-swift-bridging-header/


# Access the swift members from the objective c

* the class should inherit from NSObject 

other details are available in 

src: http://dev.iachieved.it/iachievedit/using-swift-in-an-existing-objective-c-project/
official documentation: https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html

# In swift 4

As an update, in Swift 4 we now need the @objc in front every Swift function you want to make available to Objective-C; including object variables

src:
https://stackoverflow.com/questions/41080100/swift-3-method-in-objective-c-fails-with-no-visible-interface-for-myswiftclass
