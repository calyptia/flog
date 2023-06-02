# Flog

[![go report card](https://goreportcard.com/badge/github.com/calyptia/flog)](https://goreportcard.com/report/github.com/calyptia/flog) [![docker download](https://img.shields.io/docker/pulls/calyptia/flog.svg)](https://hub.docker.com/r/calyptia/flog)

flog is a fake log generator for common log formats such as apache-common, apache error and RFC3164 syslog.

It is useful for testing some tasks which require log data like amazon kinesis log stream test.

> Thanks to [gofakeit](https://github.com/brianvoe/gofakeit) 😘
>
> And many thanks to [mingrammer](https://github.com/mingrammer/flog) for the original project 😘

## Installation

### Using go get

```bash
go get -u github.com/calyptia/flog
```

It is recommended to also run `dep ensure` to make sure that the dependencies are in the correct versions.

### Using [homebrew](https://brew.sh)

```
brew tap calyptia/flog
brew install flog
```

### Using .tar.gz archive

Download gzip file from [Github Releases](https://github.com/calyptia/flog/releases/latest) according to your OS. Then, copy the unzipped executable to under system path.

### Using [docker](https://www.docker.com)

```
docker run -it --rm calyptia/flog
```

## Usage

There are useful options. (`flog --help`)

```console
Options:
  -f, --format string      log format. available formats:
                           - apache_common
                           - apache_combined
                           - apache_error (default)
                           - rfc3164
                           - rfc5424
                           - json
                           - spring_boot
  -o, --output string      output filename. Path-like is allowed. (default "generated.log")
  -t, --type string        log output type. available types:
                           - stdout (default)
                           - log
                           - gz
  -n, --number integer     number of lines to generate.
  -b, --bytes integer      size of log line to generate in bytes (default 512).
                           "bytes" will be ignored when "number" is set.
  -s, --sleep duration     fix creation time interval for each log (default unit "seconds"). It does not actually sleep.
                           examples: 10, 20ms, 5s, 1m
  -r, --rate rate          # of logs per second
  -p, --split-by integer   set the maximum number of lines or maximum size in bytes of a log file.
                           with "number" option, the logs will be split whenever the maximum number of lines is reached.
                           with "byte" option, the logs will be split whenever the maximum size in bytes is reached.
  -w, --overwrite          overwrite the existing log files.
  -l, --loop               loop output forever until killed.
```

```console
# Generate 1000 lines of logs to stdout
$ flog

# Generate 200 lines of logs with a time interval of 10s for each log. It doesn't actually sleep while generating
$ flog -s 10s -n 200 

# Generate a single log file with 1000 lines of logs, then overwrite existing log file
$ flog -t log -w

# Generate a single log gzip file with 3000 lines of logs every 300ms. It actually sleep (delay) while generating
$ flog -t gz -o log.gz -n 3000 -d 10s

# Generate logs up to 10MB and split log files every 1MB in "web/log/*.log" path with "apache combined" format
$ flog -t log -f apache_combined -o web/log/apache.log -b 10485760 -p 1048576

# Generate logs in rfc3164 format infinitely until killed
$ flog -f rfc3164 -l
```

## Supported Formats

- Apache common
- Apache combined
- Apache error
- RFC3164
- RFC5424
- Common log fomat
- JSON
- Spring boot default

## Supported Outputs

- Stdout
- File
- Gzip

## License

[MIT](LICENSE)