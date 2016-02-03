package js.npm;
import haxe.DynamicAccess;
import haxe.extern.EitherType;
import js.node.events.EventEmitter.Event;
import js.node.http.IncomingMessage;
import js.node.http.ServerResponse;
import js.node.http.Method;
import js.node.stream.Readable;
import js.npm.request.FormData;
import js.npm.request.OAuthOptions;

@:jsRequire("request")
extern class Request extends Readable<Request> {
  @:overload(function(uri:String, callback:RequestCallback):Void {})
  @:overload(function(uri:String, options:RequestOptions, callback:RequestCallback):Void {})
  function new(uri:String):Void;

  @:overload(function(uri:String, callback:RequestCallback):Request {})
  @:overload(function(uri:String, options:RequestOptions, callback:RequestCallback):Request {})
  static function get(uri:String):Request;

  @:overload(function(uri:String, callback:RequestCallback):Request {})
  @:overload(function(uri:String, options:RequestOptions, callback:RequestCallback):Request {})
  static function head(uri:String):Request;

  @:overload(function(uri:String, callback:RequestCallback):Request {})
  @:overload(function(uri:String, options:RequestOptions, callback:RequestCallback):Request {})
  static function post(uri:String):Request;

  @:overload(function(uri:String, callback:RequestCallback):Request {})
  @:overload(function(uri:String, options:RequestOptions, callback:RequestCallback):Request {})
  static function put(uri:String):Request;

  @:overload(function(uri:String, callback:RequestCallback):Request {})
  @:overload(function(uri:String, options:RequestOptions, callback:RequestCallback):Request {})
  static function patch(uri:String):Request;

  @:overload(function(uri:String, callback:RequestCallback):Request {})
  @:overload(function(uri:String, options:RequestOptions, callback:RequestCallback):Request {})
  static function del(uri:String):Request;

  /**
    Function that creates a new cookie jar.
   **/
  static function jar():js.npm.request.CookieJar;

  /**
    This method returns a wrapper around the normal request API that defaults to whatever options you pass to it.
   **/
  static function defaults(opt:RequestOptions):RequestOptions;

  /**
    Function that creates a new cookie.
   **/
  static function cookie(val:String):Void;

  /**
    request supports application/x-www-form-urlencoded and multipart/form-data form uploads. For multipart/related refer to the multipart API.
   **/
  function form(formData:DynamicAccess<String>):Void;

  function auth(username:String, password:String, sendImmediately:Bool, bearer:String):Void;
}

@:enum abstract RequestEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
  var Response : RequestEvent<IncomingMessage->Void> = "response";
  var Error : RequestEvent<js.Error->Void> = "error";
}

typedef RequestCallback = js.Error->IncomingMessage->EitherType<String,js.node.buffer.Buffer>->Void;

typedef RequestOptions = {
  /**
    http method (default: "GET")
   **/
  @:optional var method:Method;

  /**
    fully qualified uri or a parsed url object from url.parse()
   **/
  @:optional var uri:EitherType<String, js.node.Url>;

  /**
    fully qualified uri string used as the base url.
   **/
  @:optional var baseUrl:String;

  /**
    object containing querystring values to be appended to the uri
   **/
  @:optional var qs:DynamicAccess<Dynamic>;

  /**
    object containing options to pass to the qs.parse method
   **/
  @:optional var qsParseOptions:Dynamic;
  /**
    object containing options to pass to the qs.stringify method.
   **/
  @:optional var qsStringifyOptions:Dynamic;
  /**
    If true, use querystring to stringify and parse querystrings, otherwise use qs (default: false).
    Set this option to true if you need arrays to be serialized as foo=bar&foo=baz instead of the default foo[0]=bar&foo[1]=baz.
   **/
  @:optional var useQueryString:Bool;

  /**
    entity body for PATCH, POST and PUT requests.
   **/
  @:optional var body:EitherType<js.node.buffer.Buffer, String>;

  @:optional var callback:RequestCallback;
  /**
    when passed an object or a querystring, this sets body to a querystring representation of value, and adds Content-type: application/x-www-form-urlencoded header
   **/
  @:optional var form:DynamicAccess<String>;
  /**
    Data to pass for a multipart/form-data request
   **/
  @:optional var formData:FormData;

  @:optional var auth:{ ?user:String, ?pass:String, ?sendImmediately:Bool, ?bearer:String };
  /**
    object containing AWS signing information.
    Should have the properties key, secret. Also requires the property bucket,
    unless you’re specifying your bucket as part of the path, or the request doesn’t use a bucket (i.e. GET Services).
    If you want to use AWS sign version 4 use the parameter sign_version with value 4 otherwise the default is version 2.

    Note: you need to npm install aws4 first.
   **/
  @:optional var aws:{ key:String, secret:String, ?bucket:String, ?sign_version:Int };

  /**
    follow HTTP 3xx responses as redirects (default: true).
   **/
  @:optional var followRedirect:EitherType<Bool,ServerResponse->Bool>;
  /**
    follow non-GET HTTP 3xx responses as redirects (default: false)
   **/
  @:optional var followAllRedirects:Bool;

  /**
    the maximum number of redirects to follow (default: 10)
   **/
  @:optional var maxRedirects:Int;

  /**
    If true, add an Accept-Encoding header to request compressed content encodings from the server (if not already present) and decode supported content encodings in the response. Note: Automatic decoding of the response content is performed on the body data returned through request (both through the request stream and passed to the callback function) but is not performed on the response stream (available from the response event) which is the unmodified http.IncomingMessage object which may
    contain compressed data. See example below.
   **/
  @:optional var gzip:Bool;

  @:optional var jar:EitherType<Bool, js.npm.request.CookieJar>;

  /**
    http(s).Agent instance to use
   **/
  @:optional var agent:String;

  /**
    set to true to use the forever-agent Note: Defaults to http(s).Agent({keepAlive:true}) in node 0.12+
   **/
  @:optional var forever:Bool;

  /**
    An object describing which agents to use for the request. If this option is omitted the request will use the global agent
   **/
  @:optional var pool:{ ?maxSockets:Int };
  @:optional var headers:DynamicAccess<String>;
  @:optional var oauth:OAuthOptions;
  /**
    If you specify a proxy option, then the request (and any subsequent redirects) will be sent via a connection to the proxy server.
   **/
  @:optional var proxy:String;

  /**
    Integer containing the number of milliseconds to wait for a server to send response headers (and start the response body) before aborting the request
   **/
  @:optional var timeout:Int;

  /**
    TLS/SSL protocal
   **/
  @:optional var cert:String;
  @:optional var key:String;
  @:optional var passphrase:String;
  @:optional var ca:String;
}
