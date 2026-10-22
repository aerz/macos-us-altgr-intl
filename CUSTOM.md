`master` follows `upstream/master`. `custom` keeps the layout name `U.S. International – AltGr`.

Commit your changes before you update:

```sh
git fetch upstream
git switch master
git merge --ff-only upstream/master
git switch custom
git merge master
```
