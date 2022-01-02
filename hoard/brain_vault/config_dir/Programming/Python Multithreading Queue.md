#python #parallelism  #queue #threads 
Python `queue` module official [documentation](https://docs.python.org/3/library/queue.html)

```python
from queue import Queue
from threading import 
from random import randint

task_queue = Queue()


def worker():
	while True:
		item = task_queue.get()
		print(f"Get object from queue (safely) {item}")
		... # do some work 
		print(f"Finish working on {item}")
		task_queue.task_done()
		
Thread(target=worker, daemon=True).start()
for item in range(30):
	task_queue.put(randint(item, item*4))
print("Queue if filled, now thread(s) will process it")

task_queue.join() # block this thread until all task are done
print("All items are processed")