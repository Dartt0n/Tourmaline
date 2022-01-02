#rust #parallelism #threads #atomic #beauty
```rust
let start = 956320000usize;
let end = 957000000usize;
let length = end - start;
let counter = Arc::new(AtomicUsize::new(0));
// in some thread use counter.fetch_add(1, Ordering::SeqCst);
let width = 100;
loop {
	let bars = (counter.load(Ordering::SeqCst) * width) / length;

	let percent = (counter.load(Ordering::SeqCst) * 100) / length;

	print!(
		"\r[{}] {}%",
		format!("{}{}", "=".repeat(bars), " ".repeat(width - bars)),
		percent
	);
	if counter.load(Ordering::SeqCst) == length {
		println!();
		break;
	}
}
```


 Бар печатается в формате:
 ```
 [=====               ] 20%
 ```
 
 Так к примеру, мы можем взять код из [[Thread Pool Rust| этого примера]] и тогда получится:
 ```rust
 let n_workers = 4;

let pool = ThreadPool::new(n_workers);
let start = 956320000usize;
let end = 957000000usize;
let length = end - start;
let counter = Arc::new(AtomicUsize::new(0));

let (tx, rx) = channel();
for _ in start..end {
    let tx = tx.clone();
	let counter = Arc::clone(&counter);
    pool.execute(move|| {
		// some calls here
		counter.fetch_add(1, Ordering::SeqCst);
        tx.send(1).unwrap();
    });
}

let width = 100;
loop {
	let bars = (counter.load(Ordering::SeqCst) * width) / length;

	let percent = (counter.load(Ordering::SeqCst) * 100) / length;

	print!(
		"\r[{}] {}%",
		format!("{}{}", "=".repeat(bars), " ".repeat(width - bars)),
		percent
	);
	if counter.load(Ordering::SeqCst) == length {
		println!();
		break;
	}
}
pool.join();
drop(tx);
for i in rx.iter() {
	println!("{:?}", i)
}
