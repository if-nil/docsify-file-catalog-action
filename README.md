# docsify-file-catalog-action


This repository is a github action, which is used to generate a `_sidebar.md` file based on the repository's file directory, which can be used to display a sidebar in [Docsify](https://docsify.js.org) with [docsify-sidebar-collapse](https://github.com/iPeng6/docsify-sidebar-collapse) plugin.

_This Action will use the `GITHUB_TOKEN` to add a pull commit, so the `GITHUB_TOKEN` requires write access, which can be set in the repository's setting_

## Usage

### Example Workflow file

```yml copy
on: [push]

jobs:
  add_sidebar_job:
    runs-on: ubuntu-latest
    name: job to add _sidebar.md
    steps:
      - uses: actions/checkout@v4
      - uses: if-nil/docsify-file-catalog-action@main
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          # include: '.*'
```

| inputs | description | required | default |
| --- | --- | --- | --- |
| github_token | Used to add `_sidebar.md` to the repository, requires write access. | true | null |
| include | Files what you want the directory to contain. Use regular expressions. | false | `.*\.md` |

## Example

You can see the usage inside this repository 
[actions-demo](https://github.com/if-nil/actions-demo)

``` md
- [README.md](./README.md)
- directory1
  - [file1.1.md](./directory1/file1.1.md)
  - [file1.md](./directory1/file1.md)
- directory2
  - [file2.md](./directory2/file2.md)
- directory3
  - [file3.md](./directory3/file3.md)
- [_sidebar.md](./_sidebar.md)

```
_contents of the `_sidebar.md`_
