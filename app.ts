function bogus(a, b) {
  let c = 1 
  let d = 'unused'
  return a + b + c;
  console.log('unreachable')
}

console.log(bogus(2, 3, 4))

