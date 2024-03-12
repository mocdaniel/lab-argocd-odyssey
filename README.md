# Development

## Running locally

When developing the workshop, you might want to hot-reload workshop
contents for faster feedback-loops. This is possible with Educates
in a local environment, using the following commands:

```console
# publish the local workshop
cd educates
educates publish-workshop

# serve the workshop, with contents coming from your local directory
educates serve-workshop --patch-workshop
```

You can now work on the contents in `educates/workshop/content` and they
will update in the workshop portal in real-time.
