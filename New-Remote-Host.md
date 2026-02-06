## To copy ghostty termcap to systems without it.

```
infocmp -x | ssh user@remote-host -- tic -x -o ~/.terminfo /dev/stdin
```


