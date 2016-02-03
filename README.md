# Haxe/hxnodejs externs for the [request](https://www.npmjs.com/package/request) npm library

Tested using `request` version **2.69.0**

Example:
```haxe
var request = new js.npm.Request("http://www.google.com", function(error, response, body) {
  if (error == null && response.statusCode == 200) {
    trace(body);
  }
});
```
