#rust #stdin #generics
```rust

fn read<T>() -> T

where

T: FromStr,

<T as FromStr>::Err: Debug,

{

let mut buffer = String::new();

std::io::stdin().read_line(&mut buffer).unwrap();

buffer.trim().parse::<T>().unwrap()

}
```