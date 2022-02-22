



MetaWeather shows tomorrow’s weather forecast for specific cities using the MetaWeather REST API.


-------------------
How to use
--------------
Clone this repository on your computer and hit run.

---------------------
Architecture
---------------
![ScreenShot](/MetaWeather/Screens/CitiesList/DependencyDiagram.png)
This project uses **clean arctucture** with MVVM.

Considering **CitiesList** is a feature.
1. It has its own folder.
2. **CitiesListVC**: the view controller is resposable for building the UI. And needed cells. 
3. **CitiesListVM**: the view model is resposable for view logic.
4. **CitiesListInteractor**: resposable for business logic. We don't have business logic for this feature so it is eliminated.
5. **CitiesListRepo**: resposable for getting data from NetworkDataSource.
6. **CityModel**.
7. **CityModel.json**: the json file gives future developers an idea about the data formate and used my the Moch in unit testing.

Here we use **URLSession** as a data source, it can be replaced in the future with something else like alamofire. So we have **NetworkDataSourceInterface** covers it.

We also can have different repos so we have **CitiesListRepoInterface**.

These interfaces/protocols makes it easy to mock both the data source and the repo for unit testing.

Take a look on my article for more:
https://medium.com/swift2go/clean-architecture-for-massivetobe-mobile-apps-bf8e44a98b37

---------------------
**Family name** 
---------------
Each class in the project should have a family name like: VC, VM, Interactor, Repo, DataSource etc. 
**Interface** is also add to protocol's name.

This family name indicates its job for every one according to the dependency digram.
Only helper classes can live without family name like: Code, Binder. And that can be improved. 

---------------------
Data passing
---------------
We use 3 types of data passing:
1. Regular closure callbacks
2. **"Binder"** to bind UIElements in the viewcontroller to the viewmodel. It is a light weight lib compared to Combine and RxSwift.
3. @Published in the SwiftUI part. 

------------
Testing & Test automation
---------
MVVM depends on the viewmodel for dealing with data with complete separation from the UIKit. This makes testing the viewmodel easer with no need to mock any UIElements.

Using interfaces/protocols makes it easy to mock the data source and the repo.

In initializers, we use default values for the view model and the repo to keep using it in production code simple. We don't want to trade code simplicity with testing.

To run all unit tests use the following command:
``` 
fastlane tests
```
![ScreenShot](/MetaWeatherTests/FastlaneRunUnitTest.png)
If you are not familiar with fastlane please check this link: https://docs.fastlane.tools/
