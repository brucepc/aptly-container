Aptly docker container
===

## Env vars

- ```APTLY_CONFIG``` Used to point ```aptly.conf``` file.
The default value is ```/etc/aptly.conf```.
- ```APTLY_PARAMS``` Used to auto fill some params from aptly. The container entrypoint will always add ```-config=$APTLY_CONFIG``` when run aptly.
- ```ENTRYPOINT_VERBOSE``` Used to ```set -x``` into sh entrypoint environment.

## Get started

Let's create a volume to keep the things.
```bash
docker volume create aptly.data
```
So now we create a branding new repos.
```bash
docker  run --rm -ti -v aptly.data:/aptly brucepc/aptly \
    repo create myrepo
```
Now you can publish your repos   
```bash 
docker run --rm -ti -v aptly.data:/aptly brucepc/aptly \
    publish -distribution=stretch -architectures=amd64 \
    -skip-signing repo myrepo
```
And finaly to start a server
```bash
docker run -d -v aptly.data:/aptly brucepc/aptly
```