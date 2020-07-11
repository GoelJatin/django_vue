# Django + Vue

This is my learning project to get my hands dirty with Django Web Framework and Vue.js

Ref: <https://auth0.com/blog/building-modern-applications-with-django-and-vuejs/>

I don't expect this to be a really super amazing project but do expect that by the end of this project,
I'll have some good understanding about both the technologies

## Dockerized development

Along the way we'll try to do the entire development inside Docker containers to learn another super amazing tech

More to come...

Note to self - Had a weird observation, even after exposing the port from the docker container, binding 0.0.0.0 addr, still was not able to connect to the app from the host machine

Had to add `0.0.0.0:8000` to the runserver command to be able to access it..

**Result** - Alright so after discussion in the `DSUGHyd` channel, it's clear when we run the server without `addrport` it runs inside the docker container localhost and hence does not allow connections from outside.

To run the Django server inside the docker container, we've to bind it ourselves to accept connections from all hosts and hence add the `addport` - `0.0.0.0:8000` to the *runserver* command

### Update - June 28

Alright, so we've our Django project running successfully within the Docker container and connected to Postgres DB also running inside Docker

Now let's start adding the front-end Vue app, which again as our Django app, we'll try to build entirely inside Docker container

### Update - June 29

Both our Django and Vue apps are running successfully in their own containers. Now let's go ahead and start adding the integration with Auth0

<https://auth0.com/blog/building-modern-applications-with-django-and-vuejs/#Creating-an-Auth0-API>

### Update - Jul 12

Learned another thing about Docker volumes, you need to mount your code directory as a volume on the docker container to be able to share data b/w
host and container.

Using named volumes does not work for local development
