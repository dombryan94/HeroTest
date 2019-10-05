# Dominic Bryan - Hero Test

Initial thoughts:
  - Nowhere near enough time, had to skip a lot of functionality 
  - More UI test setup needed for proper testing 
  - More code separation, i.e. removing view code from controllers
  - API is not nice to work with, no idea what you will get back, lots of nil handling

##### Why did you take the approach you took?
I first tried to get a clean network architecture that was fully testable as this project mainly revolved around retrieving and displaying JSON data. Once that was completed, I moved on to a coordinator to lay foundations for moving around the application if needed. After getting the application running and retrieving data, the next step was to start building out the UI. Now that there was data, I could work on what information can be displayed and how, I chose to display what I believed to be data that all items had, and then have a details view for all data the API provided to be displayed. View models were used for the controllers to abstract display logic away from view controllers and for testing purposes.

##### How could you improve your code test?
More test coverage is possible, in the last run it was at 91%. However, due to lack of time available to work on this project the UI testing suffered most. Ideally, I would like to stub the network calls so that during a UI test launch, the application would use the local stubs and provide the data. To quickly get some UI tests in I had to just wait/sleep in tests to allow network calls to be made (THIS SHOULD NEVER REALLY BE DONE). The UI tests are ideal for testing the flow of the app, in this case there is only two views so this is fairly overkill. Ideally, I would use some snapshot testing as well to test visual layout.

##### How long did you spend on the test?
5-6 hours was spent. No where near enough to implement everything wanted, have good test coverage and build a nice UI.

Things I would like to do with more time
  - Add UIPicker so users can select what Item property they wish to sort on
  - Wayyyyy more time spent making the UI look nice
  - UI Testing needs a lot more foundation work
  - Have more specific item types (Book, food etc.)
  - Image loader and cache (However the API is not clear and not sure if there are any images being returned)
  - Activity indicators for loading of data

