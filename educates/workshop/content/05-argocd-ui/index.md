---
title: Exploring ArgoCD
---

Once logged in, we can see **four entries** in the navbar on the left.

## Applications

The **Application view** will (of course) be empty after installing ArgoCD.
Later on, **all** of our `Applications` will be listed here, along with
additional **filter options**.

We can also **sync** or **refresh** all listed `Applications` in a bulk operation
or **create** a new `Application`.

We will get back to this view after we deployed a few Applications!

## Settings

This is where we can configure most of the things we are going to be working
with:

- **Repositories**: Sources for our `Applications` to fetch workloads from
- **Repository certificates and known hosts**: What the menu entry says 😉
- **GnuPG keys**: If we want to enforce signatures on our sources
- **Clusters**: Destinations for our `Applications` to deploy workloads to
- **Projects**: Logical units to group workloads managed by ArgoCD
- **Accounts**: Entities allowed to interact with the ArgoCD API via UI or CLI
- **Appearance**: The most important entry, as it contains the ✨Dark Mode✨

## User Info

Here we can change our **passwords** and see basic information about our own accounts.

## Documentation

Contains quick links to the Argo docs, ArgoCD's CLI tool, and the API docs.
