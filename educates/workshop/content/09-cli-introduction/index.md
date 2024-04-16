---
title: Working with the CLI
---

We now caught a first glimpse of the ArgoCD UI and how we can manage Applications from there.

However, *ClickOps* isn't well suited for automated environments such as **CI/CD** pipelines, **E2E testing**, or large-scale scenarios.

That's why ArgoCD provides a fully-fletched CLI, which is already installed to our environments - we just need to log in:

```terminal:execute
prefix: Run
title: Login to ArgoCD from the CLI
command: |
  clear && argocd login \
    grpc-argocd-{{< param session_name >}}.{{< param ingress_domain >}} \
    --username admin \
    --password $ARGO_PASSWORD
```

{{< note >}}
**Wait a minute, why the grpc-... URL?**

ArgoCD's server terminates both, **TLS** and **gRPC** traffic on the same port. As this is something not every ingress controller supports, we end up with two ingress addresses in our environment - one for each protocol.
{{< /note >}}

We can then do a fast exploration of the existing resources - we should be able to spot our `first-gitops-app` deployed in the first part of the cluster:

```terminal:execute
prefix: Run
title: Explore the CLI functionalities
command: |
  clear && argocd app list
  argocd app get argocd/first-gitops-app
  argocd proj list
  argocd proj get default
```

## Creating a New Project

You might've thought *What's this project thing* just now - and rightfully so.

Because ArgoCD **configures a default project** for us, we were able to start deploying our `first-gitops-app` right away, and it just worked.

### A Project's Structure

Let's look at the default project once more, this time from the Kubernetes side of things - internally, it is being represented by a **CRD**:

```terminal:execute
prefix: Run
title: Display the project's YAML structure
command: |
  clear && kubectl get appproject default \
    -n argocd \
    -o yaml
```

As we can see, the `default` project declares a few things:

- **resources** we're allowed to deploy in this project
- **destinations** we're allowed to deploy **to** in this project
- **sources** we're allowed to deploy **from** in this project

Notably, the `default` project allows us to do *basically anything*, as denoted by the asterisks: We're allowed to deploy anything *from* anywhere *to* anywhere.

**That's not good** - let's create a new, more narrowly scoped project!

### Defining a Project

Using the CLI command `argocd proj create`, we can *imperatively* create a new project `cli-apps`.

```terminal:execute
prefix: Run
title: Create a new project cli-apps
command: |
  argocd proj create cli-apps \
    --description 'We use the CLI now!'
```
With our project created, we can now work towards our security goals and prepare the project for our next application:

We can allow a new **destination** to deploy from with `argocd proj add-destination`, followed by our project's name, a **cluster name**, and a **namespace**.

```terminal:execute
prefix: Run
title: Allow a new destination for our project
command: |
  argocd proj add-destination cli-apps \
    --name in-cluster \
    podinfo
```

We can add a new **source** with a similar command, `argocd proj add-source` - let's add a **repository** from GitHub's **OCI registry** (we'll use it in the next step):

```terminal:execute
prefix: Run
title: Allow a new source for our project
command: |
  argocd proj add-source cli-apps \
    ghcr.io/stefanprodan/charts
```

Finally, we can allow-list all Kubernetes resources to be deployed to our project with `argocd proj allow-cluster-resource`:

```terminal:execute
prefix: Run
title: Allow all resources to be deployed to cli-apps
command: |
  argocd proj allow-cluster-resource cli-apps "*" "*"
```

We now got a brand-new, more reasonably scoped project to deploy more applications to.

Let's have a final look before going on and deploying to it:

```terminal:execute
prefix: Run
title: Review the clip-apps AppProject
command: |
  clear && kubectl get appproject cli-apps \
    -n argocd \
    -o yaml
```