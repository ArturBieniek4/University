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

module MakeListDict(Key:Map.OrderedType):DICT with type key = Key.t = struct
  type key = Key.t
  type 'a dict = (key * 'a) list
  let empty = []
  let remove k d = List.filter (fun (k', _) -> k <> k') d
  let insert k v d = (k, v) :: remove k d
  let find_opt k d = List.find_opt (fun (k', _) -> k = k') d |> Option.map snd
  let find k d = List.find (fun (k', _) -> k = k') d |> snd
  let to_list d = d
end

module CharListDict = MakeListDict(Char)
let dict = CharListDict.empty
let dict = CharListDict.insert 'a' 'b' dict