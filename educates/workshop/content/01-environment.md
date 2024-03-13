---
title: Workshop Environment
---

We already covered the **terminal**, **IDE**, and **Slides** already,
but there's more functionality in this workshop environment: **action blocks**.

Action blocks can **run code**, **copy text** to your clipboards, or **open links**
in a new **tab**.

Let's walk through some examples while exploring our environments:

We can display our dedicated (virtual) clusters by clicking the block below:

```terminal:execute
prefix: Run
title: Display node info
command: |
  kubectl get nodes -o wide
```

Sometimes it's more useful to copy text, e.g. because we will need to edit it
to our needs:

```workshop:copy
prefix: Copy
title: Let's greet ourselves!
text: |
  echo "Hello < >!"
```

One last thing before we get started *for real* - let's bin the [ArgoCD Docs](https://argo-cd.readthedocs.io)
to have them at hand whenever we might need them:

```dashboard:reload-dashboard
prefix: Tab
title: Pin the ArgoCD docs
name: ArgoCD Docs
url: https://argo-cd.readthedocs.io
```
