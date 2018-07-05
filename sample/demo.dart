void main(){

  print(upperFun("hello") == "!!! HELLO !!!");
}

upperFun(msg) => "!!! ${msg.toUpperCase()} !!!";