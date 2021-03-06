#python #threads #parallelism #async

# Threads VS Processes

### Threads (Потоки)
- Все потоки запускаются внутри одного существующего процесса
- Запуск потока быстрее, чем запуск процесса
- Все потоки запускаются на одном адрессе, те разделяют данные (всю память)
- Mutexes and Locks часто необходимо использовать из-за предыдущего пунка
- Один GIL (Global Interpreter Lock) для всех потоков

### Processes (Процессы)
- Все процессы запускаются независимо от существующего процесса (родителя)
- Запуск процесса медленне, чем запуск потока
- Каждый процесс запускается на своем собственном адрессе (клонируемым от родителя?), те каждый процесс имеет независимые данные
- Mutexes and Locks редко нужно использовать из-за предыдущего пунка
- Для кажого процесса существует свой уникальный GIL

##### Рассмотрим две версии кода:
- [[Thread Example Python | Версия с потоками]]
- [[Processes Example Python | Версия с процессами]]
Как видно, они весьма похожи, можно даже сказать идеинтичны, за исключением того, что в 1ой версии используются потоки, а во второй процессы. Однако они работают совершенно по разному. Если мы запустим system monitor мы увидим, что в первом случае существует лишь **один** процесс питона, который использует ~100% **одного** ядра, а во втором будет **несколько** потоков, которые грузят **несколько** ядер (так же до 100% загрузки)

![[Concepts_in_Concurrence.png]]
### Итоги:
- Многопроцессорность обычно используется когда есть ограниченные по cpu (cpu bound) задачи. Вы можете создать $N = cpu * cores$  процессов и будете иметь повешние производительности в $N$ раз.
- Многопоточность используется для задач завязанных на IO / Network оперциях. Можно запустить 50 (этого обычно бывает достаточно) процессов для повешения производительности. Однако стоит помнить, что после определеенного числа потоков, производительность начнет падать из-за _race condition_. Подробнее: [[Race Conditions| Race Conditions]]
### И также:
Асинхронное выполнение кода используется так же при Network/IO операциях. Асинхронность имеет преимущество в том, что вы решаете когда закончить выполнение, но вам необходимо использовать асинхронные модули и библиотеки (Не все поддерживают парадигму асинхронности). Подробнее: [[Async Python | Ассинхронность в Python]]