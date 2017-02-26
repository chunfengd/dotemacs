My dotemacs
====

## Usage

```sh
$ source init.sh
```

## Packages

### js3-mode

* link

  https://github.com/thomblake/js3-mode

* compilation

  ```sh
  $ emacs --batch -f batch-byte-compile ./lib/js3-mode/*.el
  ```

### flycheck

* link

  http://www.flycheck.org/en/latest/index.html

* compilation

  Build system http://www.flycheck.org/en/latest/contributor/contributing.html#the-build-system

  ```sh
  $ brew install cask
  $ make help # for help
  $ make init
  $ make compile
  ```

* dependencies
  - dash "2.12.1"
  - pkg-info "0.4"
  - let-alist "1.0.4" (built-in)
  - seq "1.11" (built-in)
  - emacs "24.3" (built-in)

### exec-path-from-shell

* link
  https://github.com/purcell/exec-path-from-shell
