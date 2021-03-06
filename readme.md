CI Demo App
===========

Dependencies
------------

````
sudo gem install xcpretty
bundle install
pod install
````


Run Test from the command line
------------------------------

````
PROJECT_TEMP_ROOT=$(grep -m1 PROJECT_TEMP_ROOT ${BUILD_SETTINGS} | cut -d= -f2 | xargs)

xcodebuild -project ci-demo-app.xcodeproj \
  -scheme "ci-demo-app" \
  -sdk iphonesimulator \
  -enableCodeCoverage YES \
  -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.2' test | tee xcodebuild.log | xcpretty

PROFDATA=$(find ${PROJECT_TEMP_ROOT} -name "Coverage.profdata")

slather coverage -s ci-demo-app.xcodepro
````

or

````
  xctool \
    -reporter pretty \
    -reporter junit:test_reports/results.xml \
    -reporter plain:test_reports/xctool.log \
    -destination 'platform=iOS Simulator,name=iPhone 6,OS=latest' \
    -sdk iphonesimulator \
    -scheme "ci-demo-app" \
    -workspace ci-demo-app.xcworkspace \
    build build-tests run-tests
````
    
