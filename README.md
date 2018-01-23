Yadisk
======

Command line tool for download file from Yandex.Disk through share link

## Install

```
$ gem install yadisk
```

For development:

```
$ gem install --dev yadisk
```

## How use

```
# Save to current directory
$ yadisk https://yadi.sk/i/HEjuI2Ln3RiRcQ

# Save to other directory
$ yadisk https://yadi.sk/i/HEjuI2Ln3RiRcQ /path/to/directory
```

## How use for development

```
# Local build and install to rubygems
$ gem build yadisk.gemspec && gem install yadisk-*

# Remove local file and uninstall from rubygems
$ rm yadisk-*.gem && gem uninstall yadisk

# Run script from local folder
$ ruby -Ilib ./bin/yadisk https://yadi.sk/i/HEjuI2Ln3RiRcQ
```

## Dependencies

* [wget](https://www.gnu.org/software/wget/)
* [ruby](https://www.ruby-lang.org/ru/downloads/) >= 2.2

## Test

For run test use:

```
$ rspec
```

## Contribution

Feel free for send me pull request.

## License

License (MIT) Copyright (c) 2018 Yegorov A. yegorov0725@yandex.ru
