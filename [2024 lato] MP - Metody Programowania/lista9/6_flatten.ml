[Fun.Vm.PushInt 2; Fun.Vm.PushInt 5; Fun.Vm.Prim Fun.Ast.Eq;
 Fun.Vm.Lbl "Label_000L"; Fun.Vm.PushInt 3; Fun.Vm.Lbl "Label_000L";
 Fun.Vm.PushInt 19;
 Fun.Vm.CondJmp ([Fun.Vm.Jmp "Label_000L"], [Fun.Vm.Jmp "Label_000R"])]