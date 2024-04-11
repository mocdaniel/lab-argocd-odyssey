---
title: Creating Applications from the CLI
---

Now that we have created a new project, we are going to deploy [podinfo](https://github.com/stefanprodan/podinfo),
a demo application for cloud-native practises.

Throughout this section, we'll look at a few new concepts within ArgoCD:

- How to create Applications from the CLI
- How to deploy [Helmcharts](https://helm.sh) using ArgoCD
- How to deploy OCI artifacts using ArgoCD

Let's get right to it!

## Creating the Podinfo Application

Podinfo is available as Helmchart, which allows us to

1. get the bundled manifests (either as **tar archive** or **OCI artifact**),
2. have their contents rendered by ArgoCD
3. deploy them to our cluster without having to know or access the *actual* manifests.

### Creating Applications with the CLI

Similar to `argocd proj create`, we can add a new application with `argocd app create` - there's just a *few* more parameters to choose from (145 to be precise).

Luckily enough, we can look at the CLI's help output to find examples for all the different deployment methods:

- deploying manifests
- deploying with Jsonnet
- deploying with Helm
- deploying with Kustomize
- deploying with custom plugins

```terminal:execute
prefix: Run
title: Display examples to deploy Helm applications
command: |
  clear
  argocd app create --help | grep "Create a Helm app" -A 1
```

The second example looks good! It seems like all we need to pass is

- the **source repository**
- the **helm chart**
- the **revision**
- the **destination namespace**
- the **destination Kubernetes server**

Let's forge our `argocd app create` command, getting the missing information from
[**Podinfo's GitHub repository**](https://github.com/stefanprodan/podinfo#helm):

```workshop:copy
prefix: Copy&Paste
title: Forge the argocd app create command
text: |
  argocd app create podinfo \
    --repo \
    --helm-chart \
    --revision \
    --dest-namespace \
    --dest-name \
    --sync-option CreateNamespace=true \
    --sync-policy auto
```

{{< note >}}
**I added two things for you already:**

- `sync-option CreateNamespace=true` so we don't get the same **sync error** as with our `first-gitops-app`.
- `--sync-policy auto` so our application **syncs and (re-)deploys** Podinfo **automatically** as soon as it registers changes to the source Helmchart.
{{< /note >}}

Once created, we can check the state of our Podinfo Application:

```terminal:execute
prefix: Run
title: Check the state of the Podinfo Application
command: |
  argocd app get podinfo/podinfo
```


### Passing Values to our Helm Application

If we have another look at our created