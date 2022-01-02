#rust #parallelism #threads #threadpool

ThreadPool позволяет легко контролировать множество потоков, вызываемых незавимо, но на одном массиве данных

Необходимо добавить в завимости
```toml
[dependencies]
...
threadpool = "*"
...
```

Исходный код
```rust
use threadpool::ThreadPool;
use std::sync::mpsc::channel;

let n_workers = 4;

let pool = ThreadPool::new(n_workers);

let (tx, rx) = channel();
for _ in 0..n_jobs {
    let tx = tx.clone();
    pool.execute(move|| {
        tx.send(1).unwrap();
    });
}

assert_eq!(rx.iter().take(n_jobs).fold(0, |a, b| a + b), 8);
```