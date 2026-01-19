interface Example {
  foo: String
  bar: Number
  opt?: Boolean
}

function bogus(a, b) {
  let c = 1 
  let d = 'unused'
  return a + b + c;
  console.log('unreachable')
}

const t: Example = { 
  foo: "Hello"
}

console.log(bogus(2, 3, 4))

