[![Gem Version](https://badge.fury.io/rb/yadisk.svg)](https://badge.fury.io/rb/yadisk)
[![Build Status](https://travis-ci.org/Yegorov/yadisk.svg?branch=master)](https://travis-ci.org/Yegorov/yadisk)
[![Coverage Status](https://coveralls.io/repos/github/Yegorov/yadisk/badge.svg?branch=master)](https://coveralls.io/github/Yegorov/yadisk?branch=master)

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

## Use in Windows

1. Download and install wget from [gnuwin32.sourceforge.net](http://gnuwin32.sourceforge.net/packages/wget.htm)
2. Add `<you base path>\GnuWin32\bin` (E.g. `C:\Program Files (x86)\GnuWin32\bin`) to [PATH environment variable](https://helpdeskgeek.com/windows-10/add-windows-path-environment-variable/).

## Use Docker

```
docker build -t yadisk .
docker run -v ${pwd}:/yadisk --rm -it yadisk sh # for interactive
docker run --rm yadisk yadisk https://yadi.sk/i/HEjuI2Ln3RiRcQ
docker run -v $(pwd):/yadisk --rm yadisk yadisk https://yadi.sk/i/HEjuI2Ln3RiRcQ
```

## Use Docker for Dev

To be soon

## Test

For run test use:

```
$ rspec
```

## Contribution

Feel free for send me pull request.

## License

License (MIT) Copyright (c) 2018 Yegorov A. yegorov0725@yandex.ru
