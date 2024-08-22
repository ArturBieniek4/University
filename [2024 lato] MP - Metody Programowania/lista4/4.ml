module type DICT = sig
  type key
  type 'a dict
  val empty : 'a dict
  val insert : key -> 'a -> 'a dict -> 'a dict
  val remove : key -> 'a dict -> 'a dict
  val find_opt : key -> 'a dict -> 'a option
  val find : key -> 'a dict -> 'a
  val to_list : 'a dict -> (key * 'a) list
end

module MakeMapDict(Key:Map.OrderedType):DICT with type key = Key.t = struct
  type key = Key.t
  module KeyMap = Map.Make(Key)
  type 'a dict = 'a KeyMap.t
  let empty = KeyMap.empty
  let remove = KeyMap.remove
  let insert = KeyMap.add
  let find_opt = KeyMap.find_opt
  let find = KeyMap.find
  let to_list = KeyMap.to_list
end

module CharListDict = MakeMapDict(Char)
let dict = CharListDict.empty
let dict = CharListDict.insert 'a' 'b' dict