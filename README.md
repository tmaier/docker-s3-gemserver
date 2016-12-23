# S3-based Gem Server

This script and Docker imager uploads gems to S3 and creates files which make it usable as Gem Server.

## How to use in a CI/CD pipeline

### 1. Test your gem
(out of scope here)

### 2. Package your gem
(out of scope here)

### 3. Upload your gem

```bash
$ docker run --rm -v $(pwd):/workdir -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" -e "AWS_BUCKET=$AWS_BUCKET" s3-gemserver upload
```

### 4. Update index of Gem Server

```bash
$ docker run --rm -v $(pwd):/workdir -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" -e "AWS_BUCKET=$AWS_BUCKET" s3-gemserver update_index
```

### 5. Use with Bundler

Set source to S3 bucket in `Gemfile`.

```ruby
source 's3://my_bucket'

gem 'my_secret_gem'
```

Set access key and secret key using Bundler.

```bash
$ bundle config my_bucket $AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY
```

## Environment variables

* `$AWS_ACCESS_KEY_ID`
* `$AWS_SECRET_ACCESS_KEY`
* `$AWS_BUCKET`

## Influencers
Following blog posts influenced this script and Dockerfile.

* [Alan Cohen: Self Hosted Gem Server with Jenkins and S3](https://eng.climate.com/2014/04/10/self-hosted-gem-server-with-jenkins-and-s3/)
* [Pull Request: RemoteFetcher private S3 repo support](https://github.com/rubygems/rubygems/pull/856)

## Author

[Tobias L. Maier](http://tobiasmaier.info) for [BauCloud GmbH](https://www.baucloud.com)
