Тут представлен пример кода с потоками ( [[ | версия с процессами]]  )

```python
from threading import Thread
import os
import math

def calc():
	for i in range(0, 400000000):
		math.sqth(i)

threads = []
for i in range(os.cpu_count()):
	print(f"New thread: {i}")
	threads.append(Thread(target=calc))
	
for thread in threads:
	thread.start()
	
for thread in threads:
	thread.join()