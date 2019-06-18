# heroku-mono-repo

[Heroku buildpack](https://devcenter.heroku.com/articles/buildpack-api) that makes a _service/project_ in a mono repo the root directory for deployment.

## Setup

1. Create an empty `.mono` file in the root folder of the repo.
2. Create an environment variable `HMR_APP_DIR` in Heroku and set it to the path of the service to be deployed relative to the root folder of the repo.

## Usage

Given you have the folder directory structure:

```sh
repo
 |_ pmt
 |_ usrv
 |_ .mono
```

If you want to deploy the contents of the pmt folder, you would execute the following:

```
heroku config:set HMR_APP_DIR=pmt
heroku buildpacks:add https://github.com/ekowcharles/heroku-mono-repo.git --index 1
```

We put this buildpack at index 1 because it is expected to be executed before any subsequest buildpacks are executed. Check [this](https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app) out to learn more about multiple buildpacks.

You can always clear your buildpacks using the following command:

```sh
heroku buildpacks:clear
```

## Assumptions

- The folder containing the service to be deployed contains everything it needs in and of itself to be deployed.
- No file exists in the root of the repository that is required by the service in order for it to be deployed successfully.

# License

MIT License

Copyright (c) 2019 C A Boadu Jnr

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
