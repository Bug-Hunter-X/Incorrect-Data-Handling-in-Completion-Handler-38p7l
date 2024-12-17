# Swift Data Handling Bug

This repository demonstrates a common error in Swift when handling asynchronous network requests and JSON parsing. The `fetchData` function attempts to fetch data from a remote API, parse it as JSON, and return the result via a completion handler.  However, there's a flaw in how the function handles potential errors and the data returned in the success case. This results in unexpected data being sent to the calling function.

## Bug Description

The function attempts to parse JSON data but doesn't handle potential parsing errors correctly.  Additionally, it sends the raw data array in the success case, even if the JSON parsing was successful.  The completion handler should only return the parsed JSON data in the success case.