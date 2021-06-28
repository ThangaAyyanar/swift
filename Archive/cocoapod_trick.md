# Trick that can save you from lot of trouble

```

# Podfile
 
platform :ios, '9.0'
 
use_frameworks!
 
# My other pods
 
def testing_pods
    pod 'Quick', '0.5.0'
    pod 'Nimble', '2.0.0-rc.1'
end
 
target 'MyTests' do
    testing_pods
end
 
target 'MyUITests' do
    testing_pods
end

```

url : https://www.natashatherobot.com/cocoapods-installing-same-pod-multiple-targets/#
