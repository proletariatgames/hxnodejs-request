package js.npm.request;

abstract FormDataValue(Dynamic)
  from String
  from Array<FormDataValue>
  from haxe.DynamicAccess<FormDataValue>
  from js.node.stream.Readable<Dynamic> {
}

typedef FormData = haxe.DynamicAccess<FormDataValue>;
