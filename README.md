# The simple example project how to work with XCUITest framework

## Test scenario:
- Create simpler application ToDo list.
- Create automation scripts for ToDo list application.
- Generate report after running automation scripts. 
    
## Requirements:
- Use any *object-oriented language* (Objective-C or Swift).
- Use automation patterns like *PageObject*, *data-driven* tests, etc.
- Use any testing frameworks (XCUITest). 
- provide code and clear instructions how to run it.

**Note**: please put your code in public repository.

**Note**: Please send link to this repo when you are done.


You will need the following technologies available to try it out:
* Git
* XCUITest
* Swift 5
* Xcode 
### Ho w to run

``` xcodebuild test -workspace ToDoApplication.xcworkspace -scheme ToDoApplication -destination 'platform=iOS Simulator,name=iPhone 8,OS=14.0' -resultBundlePath TestResults```

- [x] ability to run tests for different browsers/os by configuring;
- [x] ability to run tests for different environments(urls) by configuring/by command-line.

# xcresults
A command line tool to extract test summaries & screenshots from Xcode 11 XCResult files.

# Installation
Download latest version from github releases:

wget https://github.com/eroshenkoam/xcresults/releases/latest/download/xcresults

# And make it executable:

chmod +x xcresults

### Generate Allure report 

```./xcresults export TestResults.xcresult/ outputDirectory```

### Open Allure report in browser

```allure serve outputDirectory/```


![](https://d.radikal.ru/d17/2106/4e/ed1a3f25bb9f.png) 

![](https://d.radikal.ru/d42/2106/38/95f851744068.png)




