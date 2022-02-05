# CPAN upload GitHub Docker action

This GitHub action uploads a Perl module distribution archive (.tar.gz) to CPAN
that has previously been generated (i.e. with `perl Makefile.PL; make dist`).

## Example usage

On Github add two secrets `PAUSE_USERNAME` and `PAUSE_PASSWORD` under the
repository "Settings" > "Secrets" > "Actions" > "Repository secrets".

In your GitHub action:

```yaml
publish:

  name: Upload to CPAN
  runs-on: ubuntu-latest

  steps:
    - name: Switch to branch
      uses: actions/checkout@v2

    - name: Perl version
      run: perl -V

    - name: Build distribution archive
      run: |
        perl Makefile.PL
        make
        make dist

    - name: Get dist name
      id: distname
      run: echo -n "::set-output name=value::$(ls *.tar.gz)"

    - name: Upload to CPAN
      uses: augensalat/action-cpan-upload@v1
      with:
        filename: ${{ steps.distname.outputs.value }}
        username: ${{ secrets.PAUSE_USERNAME }}
        password: ${{ secrets.PAUSE_PASSWORD }}
        dry_run: 0
```
